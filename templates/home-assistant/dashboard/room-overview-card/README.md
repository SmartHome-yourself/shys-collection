# Raum-Übersicht Dashboard Card

## Zweck
Zentrale Steuerung und Überwachung aller Funktionen eines Raumes in einer übersichtlichen Dashboard Card.

## Features
- **Raum-Status**: Anwesenheit, Fenster- und Lichtstatus auf einen Blick
- **Klimadaten**: Temperatur, Luftfeuchtigkeit mit visuellen Gauges
- **Luftqualität**: CO₂, Luftdruck, Helligkeit, Bewegungssensor
- **Beleuchtungssteuerung**: Verschiedene Lichtquellen individuell steuerbar
- **Gerätesteuerung**: TV, Musikanlage, Jalousien, Ventilator
- **Heizungssteuerung**: Thermostat-Integration
- **Szenen-Buttons**: Vordefinierte Raum-Modi (Entspannung, Arbeiten, Schlafen)

## Benötigte Entitäten

### Basis-Sensoren
```yaml
# Temperatur & Luftfeuchtigkeit (DHT22, BME280, etc.)
sensor:
  - platform: template
    sensors:
      room_temperature:
        friendly_name: "Raumtemperatur"
        unit_of_measurement: "°C"
        value_template: "{{ states('sensor.esphome_room_temperature') }}"
      
      room_humidity:
        friendly_name: "Luftfeuchtigkeit"  
        unit_of_measurement: "%"
        value_template: "{{ states('sensor.esphome_room_humidity') }}"
```

### Binäre Sensoren
```yaml
binary_sensor:
  - platform: template
    sensors:
      room_occupied:
        friendly_name: "Raum belegt"
        value_template: "{{ is_state('binary_sensor.room_motion', 'on') or is_state('media_player.room_tv', 'playing') }}"
        
      room_window_open:
        friendly_name: "Fenster offen"
        value_template: "{{ is_state('binary_sensor.window_sensor', 'on') }}"
```

### Luftqualität (Optional)
```yaml
# Für CO₂-Sensor (MH-Z19, SCD30, etc.)
sensor:
  - platform: template
    sensors:
      room_co2:
        friendly_name: "CO₂"
        unit_of_measurement: "ppm"
        value_template: "{{ states('sensor.esphome_co2') }}"
```

### Beleuchtung
```yaml
# Hauptlicht
switch:
  - platform: template
    switches:
      room_main_light:
        friendly_name: "Hauptlicht"
        value_template: "{{ is_state('light.ceiling_light', 'on') }}"
        turn_on:
          service: light.turn_on
          target:
            entity_id: light.ceiling_light
        turn_off:
          service: light.turn_off
          target:
            entity_id: light.ceiling_light

# Helligkeits-Input
input_number:
  room_brightness:
    name: "Raum Helligkeit"
    min: 0
    max: 100
    step: 1
    unit_of_measurement: "%"
```

### Szenen/Scripts
```yaml
# Entspannungsmodus
script:
  room_relaxation_mode:
    alias: "Entspannungsmodus"
    sequence:
      - service: light.turn_on
        target:
          entity_id: light.room_ambient_light
        data:
          brightness_pct: 30
          color_name: "orange"
      - service: light.turn_off
        target:
          entity_id: light.room_main_light
      - service: cover.close_cover
        target:
          entity_id: cover.room_blinds

  room_work_mode:
    alias: "Arbeitsmodus"
    sequence:
      - service: light.turn_on
        target:
          entity_id: 
            - light.room_main_light
            - light.room_desk_light
        data:
          brightness_pct: 100
          color_temp: 250
      - service: cover.open_cover
        target:
          entity_id: cover.room_blinds

  room_sleep_mode:
    alias: "Schlafmodus"
    sequence:
      - service: light.turn_off
        target:
          entity_id: 
            - light.room_main_light
            - light.room_ambient_light
            - light.room_desk_light
      - service: switch.turn_off
        target:
          entity_id:
            - switch.room_tv
            - switch.room_sound_system

  room_all_off:
    alias: "Alles ausschalten"
    sequence:
      - service: homeassistant.turn_off
        target:
          area_id: wohnzimmer  # Anpassen an deinen Raum
```

## Anpassung pro Raum

### Raum-Name definieren
```yaml
input_text:
  room_name:
    name: "Raum Name"
    initial: "Wohnzimmer"
    max: 50
```

### Entity-IDs anpassen
Ersetze alle Entity-IDs durch deine spezifischen Sensoren und Geräte:
```yaml
# Beispiel für Schlafzimmer
entity: sensor.bedroom_temperature  # statt sensor.room_temperature
entity: light.bedroom_ceiling       # statt light.room_main_light
```

### Schwellenwerte anpassen
```yaml
# CO₂-Ampel für verschiedene Räume
# Büro: Strenger (600/1000 ppm)
# Wohnzimmer: Standard (800/1200 ppm)  
# Keller: Lockerer (1000/1500 ppm)
```

## Multi-Room Setup

### Vorlage für jeden Raum
```yaml
# wohnzimmer-card.yaml
!include 
  - room-overview-card.yaml
  - room_entities: !include rooms/wohnzimmer.yaml

# schlafzimmer-card.yaml  
!include
  - room-overview-card.yaml
  - room_entities: !include rooms/schlafzimmer.yaml
```

### Dashboard-Integration
```yaml
# dashboard.yaml
views:
  - title: "Räume"
    cards:
      - type: horizontal-stack
        cards:
          - !include cards/wohnzimmer-card.yaml
          - !include cards/schlafzimmer-card.yaml
          - !include cards/kueche-card.yaml
```

## Styling-Optionen

### Farbschema anpassen
```yaml
card_mod:
  style: |
    ha-card {
      --primary-color: #1976d2;      # Blau
      --accent-color: #03dac6;       # Türkis
      --card-background-color: #1e1e1e; # Dunkel
    }
```

### Responsive Anpassungen
```yaml
# Für verschiedene Bildschirmgrößen
card_mod:
  style: |
    @media (max-width: 768px) {
      ha-card {
        font-size: 14px;
      }
    }
```

## Erweiterte Features

### Automationen einbinden
```yaml
# Automatische Szenen basierend auf Tageszeit
automation:
  - alias: "Auto Work Mode Morning"
    trigger:
      platform: time
      at: "08:00:00"
    condition:
      condition: state
      entity_id: binary_sensor.room_occupied
      state: "on"
    action:
      service: script.room_work_mode
```

### Sprachsteuerung
```yaml
# Alexa/Google Assistant Integration
intent_script:
  ActivateRelaxationMode:
    speech:
      text: "Entspannungsmodus aktiviert"
    action:
      service: script.room_relaxation_mode
```

### Benachrichtigungen
```yaml
# Luftqualität-Warnungen
automation:
  - alias: "CO2 Warning"
    trigger:
      platform: numeric_state
      entity_id: sensor.room_co2
      above: 1200
    action:
      service: notify.mobile_app
      data:
        title: "Luftqualität"
        message: "CO₂-Wert im {{ states('input_text.room_name') }} zu hoch!"
```

## Troubleshooting

### Entitäten nicht verfügbar
- **Sensoren prüfen**: ESPHome/Zigbee-Verbindung testen
- **Entity-IDs**: In Entwicklertools → Zustände überprüfen
- **Permissions**: YAML-Konfiguration neu laden

### Styling funktioniert nicht
- **card-mod**: Installation über HACS prüfen
- **Browser-Cache**: Hard-Refresh (Strg+F5)
- **CSS-Syntax**: Einrückung und Anführungszeichen prüfen

### Scripts funktionieren nicht
- **Service-Calls**: Richtige Services in Entwicklertools testen
- **Entity-IDs**: Existenz und Schreibweise prüfen
- **Permissions**: Script-Rechte und Bereiche überprüfen
