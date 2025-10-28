# DWD Wetter-Warnungen Integration

## Zweck
Integration der offiziellen Wetterwarnungen vom Deutschen Wetterdienst (DWD) mit automatischen Benachrichtigungen und Sicherheitsmaßnahmen.

## Features
- **Echtzeitdaten**: Aktuelle Wetterwarnungen vom DWD
- **Warnstufen**: 4 Stufen von Information bis Extreme
- **Automatische Benachrichtigungen**: Push-Nachrichten bei neuen Warnungen
- **Sicherheitsautomationen**: Automatisches Schließen von Rollläden bei Sturm
- **Benutzerfreundlich**: Deutsche Übersetzungen und passende Icons
- **Anpassbar**: Benachrichtigungsstufen und TTS konfigurierbar

## Voraussetzungen

### Internet-Verbindung
- Stabile Internetverbindung für DWD-API-Zugriff
- Port 443 (HTTPS) muss erreichbar sein

### Mobile App für Benachrichtigungen
```yaml
# Home Assistant Companion App installiert
mobile_app:
```

### TTS (optional)
```yaml
# Google Translate TTS
tts:
  - platform: google_translate
    language: 'de'
    
# Oder Amazon Polly
tts:
  - platform: amazon_polly
    aws_access_key_id: !secret aws_access_key
    aws_secret_access_key: !secret aws_secret_key
    region_name: 'eu-central-1'
    voice: 'Marlene'
```

## Konfiguration

### 1. Region-Code finden
Gehe auf [DWD-Gemeindeschlüssel](https://www.dwd.de/DE/leistungen/opendata/help/warnungen/cap_warncellids_csv.csv) und finde deinen 9-stelligen Gemeindeschlüssel.

**Beispiele:**
- München: `09162000`
- Berlin: `11000000`
- Hamburg: `02000000`
- Köln: `05315000`

### 2. Region-Code eintragen
```yaml
# In der YAML-Datei anpassen:
resource: "https://opendata.dwd.de/climate_environment/health/alerts/cap/COMMUNEUNION_DWD_STAT/json/warnings.json"
value_template: >
  {% set region_code = "DEIN_REGION_CODE" %}  # Hier eintragen!
```

### 3. Benachrichtigungen anpassen
```yaml
# Mobile App Device ID finden in: Einstellungen > Companion App
- service: notify.mobile_app_DEIN_DEVICE
```

## Warnstufen

| Stufe | Severity | Bedeutung | Farbe |
|-------|----------|-----------|-------|
| 0 | None | Keine Warnung | Grün |
| 1 | Minor | Wetterinformation | Gelb |
| 2 | Moderate | Wetterwarnung | Orange |
| 3 | Severe | Unwetterwarnung | Rot |
| 4 | Extreme | Extreme Unwetterwarnung | Violett |

## Verfügbare Sensoren

### Basis-Sensoren
- `sensor.dwd_warnungen_region` - Anzahl aktiver Warnungen
- `sensor.dwd_warning_level` - Aktuelle Warnstufe (0-4)
- `sensor.dwd_warning_event` - Art der Wetterwarnung
- `sensor.dwd_warning_headline` - Warnung Überschrift
- `sensor.dwd_warning_description` - Detaillierte Beschreibung
- `sensor.dwd_warning_expires` - Ablaufzeit der Warnung

### Binäre Sensoren
- `binary_sensor.dwd_warning_active` - Irgendeine Warnung aktiv
- `binary_sensor.dwd_severe_warning` - Schwere Warnung (Stufe 3+)
- `binary_sensor.dwd_storm_warning` - Sturmwarnung aktiv
- `binary_sensor.dwd_rain_warning` - Regenwarnung aktiv
- `binary_sensor.dwd_thunder_warning` - Gewitterwarnung aktiv

## Dashboard-Integration

### Einfache Status-Anzeige
```yaml
type: entities
title: "Wetterwarnungen"
entities:
  - entity: sensor.dwd_warning_level
    name: "Warnstufe"
  - entity: sensor.dwd_warning_event
    name: "Ereignis"
  - entity: sensor.dwd_warning_expires
    name: "Gültig bis"
```

### Erweiterte Card
```yaml
type: conditional
conditions:
  - entity: binary_sensor.dwd_warning_active
    state: "on"
card:
  type: markdown
  content: |
    ## ⚠️ Wetterwarnung
    
    **{{ states('sensor.dwd_warning_headline') }}**
    
    {{ states('sensor.dwd_warning_description') }}
    
    *Gültig bis: {{ states('sensor.dwd_warning_expires') }}*
  card_mod:
    style: |
      ha-card {
        background-color: {% if states('sensor.dwd_warning_level') | int >= 3 %}#f44336{% elif states('sensor.dwd_warning_level') | int >= 2 %}#ff9800{% else %}#ffeb3b{% endif %};
        color: white;
      }
```

## Erweiterte Automationen

### Regionale Anpassungen
```yaml
# Küstenregion: Sturmwarnungen wichtiger
automation:
  - alias: "Küsten-Sturmwarnung"
    trigger:
      platform: state
      entity_id: binary_sensor.dwd_storm_warning
      to: "on"
    action:
      # Spezielle Maßnahmen für Küstenregion
      - service: cover.close_cover
        target:
          area_id: outdoor_area
```

### Saisonale Anpassungen
```yaml
# Winter: Eis- und Schneewarnungen
automation:
  - alias: "Winter Wetterwarnungen"
    trigger:
      platform: state
      entity_id: sensor.dwd_warning_event
    condition:
      condition: template
      value_template: >
        {{ 'eis' in trigger.to_state.state.lower() or 
           'schnee' in trigger.to_state.state.lower() or
           'glätte' in trigger.to_state.state.lower() }}
    action:
      - service: climate.set_temperature
        target:
          entity_id: climate.heating
        data:
          temperature: 21  # Heizung aufdrehen
```

### Urlaubsmodus
```yaml
# Keine Benachrichtigungen im Urlaub
automation:
  - alias: "DWD Warnung Urlaubsmodus"
    trigger:
      platform: state
      entity_id: binary_sensor.dwd_warning_active
      to: "on"
    condition:
      condition: state
      entity_id: input_boolean.vacation_mode
      state: "off"
    action:
      - service: notify.mobile_app
        data:
          title: "Wetterwarnung"
          message: "{{ states('sensor.dwd_warning_headline') }}"
```

## Fehlerbehebung

### Keine Warnungen empfangen
1. **Region-Code prüfen**: Richtigen 9-stelligen Code verwenden
2. **Internet-Verbindung**: DWD-Server erreichbar testen
3. **Logs prüfen**: `sensor.dwd_warnungen_region` in Entwicklertools

### Falsche Benachrichtigungen
1. **Gerätename prüfen**: Companion App Device ID verifizieren
2. **Benachrichtigungen aktiviert**: In App-Einstellungen prüfen
3. **Filter testen**: Input Select Benachrichtigungs-Level anpassen

### API-Probleme
```yaml
# Timeout erhöhen bei langsamer Verbindung
sensor:
  - platform: rest
    timeout: 60  # Standard: 30
    scan_interval: 1800  # Seltener abfragen: 30min
```

### Debugging aktivieren
```yaml
logger:
  default: warning
  logs:
    homeassistant.components.rest: debug
    homeassistant.components.template: debug
```

## Weitere Integrationen

### HACS Wetter-Komponenten
- **DWD Weather Warnings**: Offizielle HACS-Integration
- **Deutscher Wetterdienst**: Erweiterte Wetterdaten
- **Weather Card**: Bessere Dashboard-Darstellung

### Node-RED Integration
```javascript
// Node-RED Flow für erweiterte Logik
msg.payload = {
  warning_level: msg.payload.warning_level,
  actions: calculateActions(msg.payload)
};
return msg;
```

### InfluxDB/Grafana
```yaml
# Langzeit-Statistiken
influxdb:
  include:
    entities:
      - sensor.dwd_warning_level
      - binary_sensor.dwd_warning_active
```

## Datenschutz

### Datenübertragung
- Alle Daten kommen direkt vom DWD (opendata.dwd.de)
- Keine Drittanbieter oder kommerzielle APIs
- Open Data Initiative der deutschen Regierung

### Lokale Verarbeitung
- Alle Berechnungen erfolgen lokal in Home Assistant
- Keine Übertragung persönlicher Daten
- Reine Pull-Architektur (keine Webhooks)
