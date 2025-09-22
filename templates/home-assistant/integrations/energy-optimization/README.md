# Energy Optimization Integration

## Zweck
Intelligente Energieverteilung und PV-Überschuss-Management mit automatischer Gerätesteuerung basierend auf Strompreisen, PV-Erzeugung und Batteriestatus.

## Features
- **PV-Überschuss Management**: Automatische Nutzung von Solarstrom-Überschüssen
- **Dynamische Strompreise**: Optimierung basierend auf Tibber/aWATTar-Tarifen
- **Geräte-Priorisierung**: Konfigurierbare Reihenfolge für Verbraucher
- **Batterie-Management**: Intelligente Lade-/Entladestrategien
- **Kostenoptimierung**: Minimierung der Stromkosten
- **Automatisierte Zeitplanung**: Optimale Laufzeiten für Geräte
- **Einsparungsanalyse**: Tracking der Kostenreduzierung

## Voraussetzungen

### Basis-Sensoren
```yaml
# PV-Anlage (SolarEdge, Fronius, SMA, etc.)
sensor:
  - platform: solaredge
    api_key: !secret solaredge_api
    site_id: !secret solaredge_site
    
# Stromzähler (Shelly EM, Tibber, etc.)
sensor:
  - platform: shelly
    ip_address: 192.168.1.100
    
# Dynamische Strompreise
sensor:
  - platform: tibber
    access_token: !secret tibber_token
```

### Geräte-Integration
```yaml
# Schaltbare Verbraucher
switch:
  - platform: shelly
    ip_address: 192.168.1.101  # Warmwasserbereiter
    name: "Water Heater"
    
  - platform: shelly
    ip_address: 192.168.1.102  # E-Auto Ladestation
    name: "Car Charger"
    
# Waschmaschine/Spülmaschine Status
binary_sensor:
  - platform: template
    sensors:
      washing_machine_ready:
        friendly_name: "Waschmaschine bereit"
        value_template: >
          {{ is_state('switch.washing_machine', 'off') and
             states('sensor.washing_machine_door') == 'closed' }}
```

### Batteriespeicher (Optional)
```yaml
# Tesla Powerwall, BYD, etc.
sensor:
  - platform: powerwall
    ip_address: 192.168.1.200
    
# Oder über Modbus/REST API
sensor:
  - platform: rest
    resource: "http://192.168.1.200/api/system_status/soe"
    name: "Battery SOC"
    value_template: "{{ value_json.percentage }}"
```

## Konfiguration

### 1. Basis-Sensoren anpassen
```yaml
# In der YAML-Datei die Entity-IDs anpassen:
sensor:
  energy_surplus:
    value_template: >
      {% set pv_power = states('sensor.DEIN_PV_SENSOR') | float(0) %}
      {% set house_power = states('sensor.DEIN_VERBRAUCH_SENSOR') | float(0) %}
      {{ (pv_power - house_power) | round(0) }}
```

### 2. Strompreis-Integration
```yaml
# Für Tibber
sensor:
  - platform: tibber
    access_token: !secret tibber_token
    
# Für aWATTar
sensor:
  - platform: rest
    resource: "https://api.awattar.de/v1/marketdata"
    name: "aWATTar Price"
    value_template: "{{ value_json.data[0].marketprice / 1000 + 0.07 }}"
```

### 3. Geräte-Prioritäten konfigurieren
```yaml
# Im Input Select anpassen:
input_select:
  energy_device_priority:
    options:
      - "Warmwasser > E-Auto > Waschmaschine > Pool"
      - "E-Auto > Warmwasser > Waschmaschine > Pool"
      - "Pool > Warmwasser > E-Auto > Waschmaschine"
```

## Optimierungs-Modi

### 1. Nur PV-Überschuss
- Geräte starten nur bei Solarstrom-Überschuss
- Mindest-Überschuss konfigurierbar (Standard: 1000W)
- Schutz vor Netzbezug

### 2. Günstige Strompreise
- Aktivierung bei Preisen unter Schwellenwert
- Besonders für Nachtstrom-Tarife
- Kombination mit Batterieladung

### 3. Vollautomatisch
- Kombination aller Optimierungsstrategien
- PV-Prognose-basierte Zeitplanung
- Maximale Kostenersparnis

### 4. Manuell/Aus
- Keine automatischen Aktionen
- Nur Monitoring und Benachrichtigungen

## Geräte-Kategorien

### Priorisierte Verbraucher
1. **Warmwasser** (2-3kW, flexibel)
   - Hohe Speicherkapazität
   - Wenig zeitkritisch
   - Ideal für PV-Überschuss

2. **E-Auto** (3-11kW, planbar)
   - Hoher Energiebedarf
   - Meist nachts verfügbar
   - Intelligent steuerbar

3. **Waschmaschine/Spülmaschine** (1-2kW, zeitflexibel)
   - Kurze Laufzeit
   - Planbare Zyklen
   - Geringer Energiebedarf

4. **Pool-/Teichpumpe** (0.5-1kW, dauerhaft)
   - Kontinuierlicher Betrieb möglich
   - Speicherwirkung des Wassers
   - Wenig zeitkritisch

### Nicht-essentielle Verbraucher
- Gartenbewässerung
- Werkstatt-Heizung
- Sauna/Whirlpool
- Elektro-Heizstäbe

## Erweiterte Features

### PV-Prognose Integration
```yaml
# Forecast.Solar API
sensor:
  - platform: rest
    name: "PV Forecast Today"
    resource_template: >
      https://api.forecast.solar/estimate/{{ latitude }}/{{ longitude }}/{{ azimuth }}/{{ tilt }}/{{ power }}
    value_template: "{{ value_json.result.total_today }}"
    
# Optimaler Zeitpunkt berechnen
sensor:
  - platform: template
    sensors:
      optimal_device_start_time:
        value_template: >
          {% set forecast = state_attr('sensor.pv_forecast_today', 'hourly') %}
          {% if forecast %}
            {% set peak_hour = forecast.index(forecast | max) %}
            {{ (peak_hour + 8) % 24 }}:00
          {% endif %}
```

### Kosten-Tracking
```yaml
# Einsparungen berechnen
sensor:
  - platform: template
    sensors:
      monthly_savings:
        value_template: >
          {% set days = now().day %}
          {% set daily_avg = states('sensor.energy_savings_daily') | float %}
          {{ (daily_avg * days) | round(2) }}
        unit_of_measurement: "€"
        
# ROI-Berechnung für Optimierungen
sensor:
  - platform: template
    sensors:
      optimization_roi:
        value_template: >
          {% set savings = states('sensor.monthly_savings') | float %}
          {% set investment = 500 %}  # Kosten für Smart-Geräte
          {{ (savings * 12 / investment * 100) | round(1) if savings > 0 else 0 }}
        unit_of_measurement: "%"
```

### Wetterbasierte Optimierung
```yaml
# Regenvorhersage für Bewässerung
automation:
  - alias: "Bewässerung bei Regen-Prognose stoppen"
    trigger:
      platform: numeric_state
      entity_id: sensor.rain_forecast_today
      above: 5  # mm Regen erwartet
    action:
      - service: switch.turn_off
        target:
          entity_id: switch.garden_irrigation
```

### Load Balancing
```yaml
# Maximaler Hausanschluss überwachen
binary_sensor:
  - platform: template
    sensors:
      house_power_limit_reached:
        value_template: >
          {{ states('sensor.house_consumption') | float > 9000 }}  # 9kW Limit
        delay_on: "00:01:00"

automation:
  - alias: "Load Balancing bei Überlast"
    trigger:
      platform: state
      entity_id: binary_sensor.house_power_limit_reached
      to: "on"
    action:
      - service: switch.turn_off
        target:
          entity_id: switch.lowest_priority_device
```

## Dashboard-Integration

### Energie-Übersicht Card
```yaml
type: entities
title: "Energieoptimierung"
entities:
  - sensor.energy_surplus
  - sensor.electricity_price_level
  - input_select.energy_optimization_mode
  - binary_sensor.energy_optimization_conditions_met
  - sensor.energy_cost_forecast
```

### Geräte-Status Card
```yaml
type: glance
title: "Optimierte Geräte"
entities:
  - entity: switch.water_heater
    name: "Warmwasser"
  - entity: switch.car_charger
    name: "E-Auto"
  - entity: switch.washing_machine
    name: "Waschmaschine"
  - entity: switch.dishwasher
    name: "Spülmaschine"
```

### Einsparungen Chart
```yaml
type: history-graph
title: "Energieeinsparungen"
hours_to_show: 168  # 1 Woche
entities:
  - sensor.energy_cost_savings
  - sensor.pv_surplus_used
```

## Automatisierung-Beispiele

### Morgen-Routine
```yaml
automation:
  - alias: "Morgen Energieoptimierung"
    trigger:
      platform: time
      at: "06:00:00"
    action:
      # Warmwasser vorheizen für Duschen
      - condition: numeric_state
        entity_id: sensor.pv_forecast_today
        above: 20  # kWh erwartet
      - service: script.energy_start_water_heater
```

### Abend-Vorbereitung
```yaml
automation:
  - alias: "Abend Gerätevorbereitung"
    trigger:
      platform: time
      at: "20:00:00"
    action:
      # Waschmaschine für Nachtstrom vorbereiten
      - condition: state
        entity_id: binary_sensor.electricity_price_cheap
        state: "on"
      - condition: state
        entity_id: binary_sensor.washing_machine_ready
        state: "on"
      - service: notify.mobile_app
        data:
          title: "🌙 Nachtstrom verfügbar"
          message: "Waschmaschine kann gestartet werden"
          data:
            actions:
              - action: "start_washing"
                title: "Jetzt starten"
```

## Troubleshooting

### Geräte starten nicht automatisch
1. **Bedingungen prüfen**: Alle Sensoren verfügbar?
2. **Schwellenwerte**: PV-Überschuss hoch genug?
3. **Modi**: Optimierung aktiviert?
4. **Geräte-Status**: Bereitschaft der Verbraucher?

### Falsche Kostenberechnung
1. **Strompreis-Sensor**: Aktuell und korrekt?
2. **Einheiten**: kW vs W, kWh vs Wh konsistent?
3. **Grundgebühren**: In Berechnung einbezogen?

### Überlastung des Hausanschlusses
1. **Load Balancing**: Maximale Leistung konfigurieren
2. **Prioritäten**: Wichtige Verbraucher schützen
3. **Zeitverzögerung**: Nicht alle Geräte gleichzeitig starten

### Batterie-Probleme
1. **SOC-Limits**: Min/Max-Ladezustand einhalten
2. **Zyklen-Schonung**: Nicht konstant laden/entladen
3. **Temperatur**: Bei Hitze/Kälte reduzierte Leistung
