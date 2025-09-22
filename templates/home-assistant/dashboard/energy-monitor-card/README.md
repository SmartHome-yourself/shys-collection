# Energie-Monitor Dashboard Card

## Zweck
Umfassende Überwachung und Steuerung des Energieverbrauchs, der PV-Erzeugung und der Stromkosten in einem zentralen Dashboard.

## Features
- **Energie-Übersicht**: Gesamtverbrauch, PV-Erzeugung, Tageskosten
- **Live-Monitoring**: Aktuelle Leistungswerte in Echtzeit
- **Energie-Fluss**: Visualisierung der Energieströme zwischen Netz, PV, Haus und Batterie
- **Bereichsverbrauch**: Aufschlüsselung nach Räumen/Gerätegruppen
- **Strompreise**: Aktuelle Tarife und günstige Zeiten
- **Verlaufsdiagramm**: 24h-Historie von Verbrauch und Erzeugung
- **Smart-Empfehlungen**: Automatische Optimierungsvorschläge
- **Schnellaktionen**: Eco-Modus, PV-Überschuss-Nutzung, Nachtmodus

## Benötigte Hardware

### Stromzähler Integration
```yaml
# Shelly EM für Hauptzähler
sensor:
  - platform: shelly
    ip_address: 192.168.1.100
    
# Oder Tibber für Smart Meter
sensor:
  - platform: tibber
    access_token: !secret tibber_token
```

### PV-Anlage Monitoring
```yaml
# SolarEdge/Fronius/SMA Wechselrichter
sensor:
  - platform: solaredge
    api_key: !secret solaredge_api
    site_id: !secret solaredge_site_id
    
# Oder über Modbus
modbus:
  - name: "fronius"
    type: tcp
    host: 192.168.1.50
    port: 502
    sensors:
      - name: "PV Power"
        slave: 1
        address: 40083
        data_type: uint16
        unit_of_measurement: "W"
```

### Einzelverbraucher (Optional)
```yaml
# Shelly Plug S für einzelne Geräte
switch:
  - platform: shelly
    ip_address: 192.168.1.101  # Waschmaschine
  - platform: shelly  
    ip_address: 192.168.1.102  # Spülmaschine
```

## Sensor-Konfiguration

### Basis-Sensoren
```yaml
sensor:
  # Gesamtverbrauch berechnen
  - platform: template
    sensors:
      energy_consumption_total:
        friendly_name: "Gesamtverbrauch heute"
        unit_of_measurement: "kWh"
        value_template: >
          {{ (states('sensor.energy_meter_total') | float) | round(2) }}
        
      power_consumption_current:
        friendly_name: "Aktueller Verbrauch"
        unit_of_measurement: "W"
        value_template: >
          {{ states('sensor.shelly_em_power') | float | round(0) }}

  # PV-Erzeugung
  - platform: template
    sensors:
      energy_production_total:
        friendly_name: "PV-Erzeugung heute"
        unit_of_measurement: "kWh"
        value_template: >
          {{ states('sensor.solaredge_energy_today') | float | round(2) }}
        
      power_production_current:
        friendly_name: "Aktuelle PV-Leistung"
        unit_of_measurement: "W"
        value_template: >
          {{ states('sensor.solaredge_power') | float | round(0) }}

  # Netzstrom (positiv = Bezug, negativ = Einspeisung)
  - platform: template
    sensors:
      grid_power:
        friendly_name: "Netzleistung"
        unit_of_measurement: "W"
        value_template: >
          {{ (states('sensor.power_consumption_current') | float - states('sensor.power_production_current') | float) | round(0) }}
```

### Stromkosten berechnen
```yaml
sensor:
  # Tageskosten
  - platform: template
    sensors:
      energy_costs_today:
        friendly_name: "Stromkosten heute"
        unit_of_measurement: "€"
        value_template: >
          {% set consumption = states('sensor.energy_consumption_total') | float %}
          {% set production = states('sensor.energy_production_total') | float %}
          {% set price_kwh = 0.32 %}  # 32 Cent/kWh
          {% set feed_in = 0.08 %}   # 8 Cent/kWh Einspeisung
          {{ ((consumption * price_kwh) - (production * feed_in)) | round(2) }}

  # Strompreis (dynamisch bei Tibber/aWATTar)
  - platform: tibber
    access_token: !secret tibber_token
```

### Bereichsverbrauch
```yaml
# Verbrauch nach Räumen/Bereichen
sensor:
  - platform: template
    sensors:
      kitchen_power:
        friendly_name: "Küche Verbrauch"
        unit_of_measurement: "W"
        value_template: >
          {{ (states('sensor.dishwasher_power') | float + 
              states('sensor.oven_power') | float +
              states('sensor.fridge_power') | float) | round(0) }}
              
      living_room_power:
        friendly_name: "Wohnzimmer Verbrauch"
        unit_of_measurement: "W"
        value_template: >
          {{ (states('sensor.tv_power') | float + 
              states('sensor.sound_system_power') | float) | round(0) }}
```

## Smart-Funktionen

### Günstige Stunden erkennen
```yaml
binary_sensor:
  - platform: template
    sensors:
      cheap_electricity_hours:
        friendly_name: "Günstige Stromstunden"
        value_template: >
          {{ states('sensor.electricity_price_current') | float < 0.25 }}
          
      high_pv_production:
        friendly_name: "Hohe PV-Erzeugung"
        value_template: >
          {{ states('sensor.power_production_current') | float > 2000 }}
```

### Optimierungs-Scripts
```yaml
script:
  energy_eco_mode:
    alias: "Energie Eco-Modus"
    sequence:
      - service: climate.set_temperature
        target:
          entity_id: climate.house_heating
        data:
          temperature: 19  # Heizung reduzieren
      - service: switch.turn_off
        target:
          entity_id: 
            - switch.standby_devices  # Standby-Geräte aus
            - switch.outdoor_lights   # Außenbeleuchtung aus
      - service: notify.mobile_app
        data:
          title: "Eco-Modus aktiviert"
          message: "Energieverbrauch wird reduziert"

  use_pv_excess:
    alias: "PV-Überschuss nutzen"
    sequence:
      - condition: template
        value_template: >
          {{ states('sensor.power_production_current') | float > 
             states('sensor.power_consumption_current') | float + 1000 }}
      - service: switch.turn_on
        target:
          entity_id:
            - switch.water_heater     # Warmwasser
            - switch.car_charger      # E-Auto laden
            - switch.heat_pump        # Wärmepumpe
      - service: notify.mobile_app
        data:
          title: "PV-Überschuss genutzt"
          message: "Energieintensive Geräte eingeschaltet"
```

### Automatisierungen
```yaml
automation:
  - alias: "Auto PV-Überschuss Nutzung"
    trigger:
      platform: numeric_state
      entity_id: sensor.grid_power
      below: -1000  # 1kW Überschuss
      for: "00:05:00"
    action:
      - service: script.use_pv_excess

  - alias: "Hoher Verbrauch Warnung"
    trigger:
      platform: numeric_state
      entity_id: sensor.power_consumption_current
      above: 4000  # 4kW Verbrauch
      for: "00:02:00"
    action:
      - service: notify.mobile_app
        data:
          title: "⚡ Hoher Stromverbrauch"
          message: "Aktuell {{ states('sensor.power_consumption_current') }}W"
```

## Erweiterte Features

### Batterie-Integration
```yaml
# Für Batteriespeicher (Tesla Powerwall, etc.)
sensor:
  - platform: template
    sensors:
      battery_power:
        friendly_name: "Batterie Leistung"
        unit_of_measurement: "W"
        value_template: >
          {{ states('sensor.powerwall_battery_power') | float }}
      
      battery_soc:
        friendly_name: "Batterie Ladezustand"
        unit_of_measurement: "%"
        value_template: >
          {{ states('sensor.powerwall_charge') | float }}
```

### Energie-Forecasting
```yaml
# Wetterbasierte PV-Prognose
sensor:
  - platform: rest
    name: "PV Forecast"
    resource: "https://api.forecast.solar/estimate/{{ lat }}/{{ lon }}/{{ declination }}/{{ azimuth }}/{{ modules_power }}"
    value_template: "{{ value_json.result.total_today }}"
    unit_of_measurement: "kWh"
```

### Export zu InfluxDB
```yaml
# Für detaillierte Langzeit-Analyse
influxdb:
  host: localhost
  port: 8086
  database: home_assistant
  include:
    entities:
      - sensor.power_consumption_current
      - sensor.power_production_current
      - sensor.grid_power
      - sensor.electricity_price_current
```

## Troubleshooting

### Sensoren nicht verfügbar
- **Modbus-Verbindung**: Wechselrichter-IP und Port prüfen
- **Shelly-Geräte**: MQTT-Konfiguration und Netzwerk testen
- **API-Keys**: Gültigkeit bei SolarEdge/Tibber prüfen

### Falsche Berechnungen
- **Vorzeichen prüfen**: Grid Power Richtung (positiv/negativ)
- **Einheiten**: kW vs W, kWh vs Wh konsistent verwenden
- **Zeitzonen**: UTC vs lokale Zeit bei Tarifen

### Performance-Optimierung
- **Update-Intervalle**: Nicht alle Sensoren jede Sekunde
- **History**: Nur relevante Sensoren langfristig speichern
- **Berechnungen**: Template-Sensoren mit sinnvollen Rundungen
