# Garagentor Dashboard Card

## Zweck
Vollständige Steuerung und Überwachung des Garagentors mit Sicherheitsfeatures, Automatisierung und Umgebungssteuerung.

## Features
- **Status-Visualisierung**: Farbcodierte Anzeige des Tor-Status
- **Manuelle Steuerung**: Öffnen, Schließen, Stopp-Funktionen
- **Sicherheitsüberwachung**: Lichtschranke, Kontaktsensoren, Batteriestand
- **Beleuchtungssteuerung**: Haupt-, Arbeits- und Automatiklicht
- **Automatisierung**: Zeitgesteuertes Schließen, Nachtmodus
- **Szenen**: Wegfahren, Heimkommen, Wartung, Sicherheitscheck
- **Warnungen**: Tor zu lange offen, Hindernisse, schwache Batterien

## Benötigte Hardware

### Garagentorantrieb
```yaml
# Relais für Torantrieb (Impulssignal)
cover:
  - platform: template
    covers:
      garage_door:
        friendly_name: "Garagentor"
        position_template: "{{ states('sensor.garage_door_position') }}"
        open_cover:
          service: switch.turn_on
          target:
            entity_id: switch.garage_door_relay
        close_cover:
          service: switch.turn_on
          target:
            entity_id: switch.garage_door_relay
        stop_cover:
          service: switch.turn_on
          target:
            entity_id: switch.garage_door_relay
        icon_template: >-
          {% if states('sensor.garage_door_position') | int == 0 %}
            mdi:garage
          {% elif states('sensor.garage_door_position') | int == 100 %}
            mdi:garage-open
          {% else %}
            mdi:garage-alert
          {% endif %}
```

### Sensoren
```yaml
# Tor-Kontakt (Reed-Sensor oben)
binary_sensor:
  - platform: gpio
    pin: GPIO14
    name: "Garage Door Contact"
    id: garage_door_contact
    device_class: garage_door
    filters:
      - delayed_on_off: 100ms

# Lichtschranke (Sicherheit)
binary_sensor:
  - platform: gpio
    pin: GPIO12
    name: "Garage Light Barrier"
    id: garage_light_barrier
    device_class: safety
    filters:
      - delayed_on_off: 50ms

# Bewegungsmelder
binary_sensor:
  - platform: gpio
    pin: GPIO13
    name: "Garage Motion"
    id: garage_motion
    device_class: motion
    filters:
      - delayed_on: 100ms
      - delayed_off: 30s
```

### Position (Optional - für präzise Anzeige)
```yaml
# Ultraschall-Sensor für Position
sensor:
  - platform: ultrasonic
    trigger_pin: GPIO5
    echo_pin: GPIO18
    name: "Garage Door Position Raw"
    id: garage_position_raw
    internal: true
    
  - platform: template
    sensors:
      garage_door_position:
        friendly_name: "Garagentor Position"
        unit_of_measurement: "%"
        value_template: >
          {% set distance = states('sensor.garage_door_position_raw') | float %}
          {% set min_dist = 20 %}  # Tor geschlossen (cm)
          {% set max_dist = 200 %} # Tor offen (cm)
          {% if distance <= min_dist %}
            0
          {% elif distance >= max_dist %}
            100
          {% else %}
            {{ ((distance - min_dist) / (max_dist - min_dist) * 100) | round(0) }}
          {% endif %}
```

## Sicherheits-Konfiguration

### Template-Sensoren für Sicherheit
```yaml
binary_sensor:
  - platform: template
    sensors:
      garage_security_issue:
        friendly_name: "Garage Sicherheitsproblem"
        value_template: >
          {{ is_state('binary_sensor.garage_door_open_too_long', 'on') or
             is_state('binary_sensor.garage_light_barrier_blocked', 'on') or
             is_state('binary_sensor.garage_door_battery_low', 'on') }}
        device_class: safety

      garage_door_open_too_long:
        friendly_name: "Tor zu lange offen"
        value_template: >
          {{ is_state('cover.garage_door', 'open') and
             (as_timestamp(now()) - as_timestamp(states.cover.garage_door.last_changed)) > 3600 }}
        delay_on: "01:00:00"

      garage_light_barrier_blocked:
        friendly_name: "Lichtschranke blockiert"
        value_template: >
          {{ is_state('binary_sensor.garage_light_barrier', 'off') }}
        delay_on: "00:00:05"

      garage_door_battery_low:
        friendly_name: "Garagentor Batterie schwach"
        value_template: >
          {{ states('sensor.garage_door_battery') | int < 20 }}
```

### Öffnungs-Dauer berechnen
```yaml
sensor:
  - platform: template
    sensors:
      garage_door_open_duration:
        friendly_name: "Garagentor offen seit"
        unit_of_measurement: "min"
        value_template: >
          {% if is_state('cover.garage_door', 'open') %}
            {{ ((as_timestamp(now()) - as_timestamp(states.cover.garage_door.last_changed)) / 60) | round(0) }}
          {% else %}
            0
          {% endif %}
```

## Automatisierungen

### Automatisches Schließen
```yaml
automation:
  - alias: "Garage Auto Close"
    trigger:
      platform: state
      entity_id: cover.garage_door
      to: "open"
      for: "00:{{ states('input_number.garage_auto_close_delay') | int }}:00"
    condition:
      condition: state
      entity_id: input_boolean.garage_auto_close
      state: "on"
    action:
      - service: cover.close_cover
        target:
          entity_id: cover.garage_door
      - service: notify.mobile_app
        data:
          title: "🏠 Garagentor"
          message: "Automatisch geschlossen nach {{ states('input_number.garage_auto_close_delay') }} Minuten"
```

### Willkommen-Automatik
```yaml
automation:
  - alias: "Garage Welcome Home"
    trigger:
      - platform: zone
        entity_id: person.user
        zone: zone.home
        event: enter
      - platform: state
        entity_id: binary_sensor.garage_motion
        to: "on"
    condition:
      - condition: state
        entity_id: input_boolean.garage_welcome_enabled
        state: "on"
      - condition: state
        entity_id: cover.garage_door
        state: "closed"
    action:
      - service: light.turn_on
        target:
          entity_id: light.garage_main_light
        data:
          brightness_pct: 100
      - delay: 3
      - service: cover.open_cover
        target:
          entity_id: cover.garage_door
```

### Sicherheits-Automatik
```yaml
automation:
  - alias: "Garage Security Night"
    trigger:
      platform: time
      at: "22:00:00"
    condition:
      condition: state
      entity_id: input_boolean.garage_night_mode
      state: "on"
    action:
      - service: cover.close_cover
        target:
          entity_id: cover.garage_door
      - service: switch.turn_off
        target:
          entity_id: 
            - switch.garage_main_light
            - switch.garage_work_light
      - service: switch.turn_on
        target:
          entity_id: switch.garage_automatic_light
```

## Scripts für Szenen

### Wegfahren-Script
```yaml
script:
  garage_leaving_home:
    alias: "Wegfahren Garage"
    sequence:
      - service: light.turn_on
        target:
          entity_id: light.garage_main_light
      - service: cover.open_cover
        target:
          entity_id: cover.garage_door
      - wait_for_trigger:
          platform: state
          entity_id: binary_sensor.garage_motion
          to: "off"
          for: "00:01:00"
        timeout: "00:05:00"
      - service: cover.close_cover
        target:
          entity_id: cover.garage_door
      - delay: 30
      - service: light.turn_off
        target:
          entity_id: light.garage_main_light
```

### Wartungs-Script
```yaml
script:
  garage_maintenance_mode:
    alias: "Garage Wartungsmodus"
    sequence:
      - service: input_boolean.turn_off
        target:
          entity_id: 
            - input_boolean.garage_auto_close
            - input_boolean.garage_night_mode
      - service: light.turn_on
        target:
          entity_id: 
            - light.garage_main_light
            - light.garage_work_light
        data:
          brightness_pct: 100
      - service: switch.turn_on
        target:
          entity_id: switch.garage_ventilation
      - service: notify.mobile_app
        data:
          title: "🔧 Garage Wartungsmodus"
          message: "Alle Automatiken deaktiviert, Vollbeleuchtung aktiviert"
```

## Input-Helper

### Boolean-Helper
```yaml
input_boolean:
  garage_auto_close:
    name: "Garage automatisch schließen"
    initial: true
    icon: "mdi:garage-alert"
    
  garage_night_mode:
    name: "Garage Nachtmodus"
    initial: true
    icon: "mdi:sleep"
    
  garage_welcome_enabled:
    name: "Willkommen-Automatik"
    initial: false
    icon: "mdi:home-assistant"
```

### Number-Helper
```yaml
input_number:
  garage_auto_close_delay:
    name: "Auto-Schließen Verzögerung"
    min: 5
    max: 120
    step: 5
    initial: 30
    unit_of_measurement: "min"
    icon: "mdi:timer"
```

## Mobile App Integration

### Actionable Notifications
```yaml
automation:
  - alias: "Garage Security Alert"
    trigger:
      platform: state
      entity_id: binary_sensor.garage_security_issue
      to: "on"
    action:
      - service: notify.mobile_app
        data:
          title: "⚠️ Garage Sicherheitsproblem"
          message: >
            {% if is_state('binary_sensor.garage_door_open_too_long', 'on') %}
            Tor seit {{ states('sensor.garage_door_open_duration') }} Min. offen
            {% elif is_state('binary_sensor.garage_light_barrier_blocked', 'on') %}
            Lichtschranke blockiert
            {% elif is_state('binary_sensor.garage_door_battery_low', 'on') %}
            Batterie schwach ({{ states('sensor.garage_door_battery') }}%)
            {% endif %}
          data:
            actions:
              - action: "garage_close"
                title: "Schließen"
              - action: "garage_check"
                title: "Prüfen"
```

## Troubleshooting

### Tor reagiert nicht
1. **Relais-Verkabelung**: Impulssignal korrekt angeschlossen
2. **Stromversorgung**: Antrieb und ESP32 versorgt
3. **Timing**: Impuls-Dauer anpassen (100-500ms)

### Falsche Position
1. **Sensor-Kalibrierung**: Min/Max-Distanzen anpassen
2. **Sensormontage**: Ultraschall senkrecht zur Bewegung
3. **Filter**: Glättung der Messwerte aktivieren

### Sicherheit funktioniert nicht
1. **Lichtschranke**: Ausrichtung und Verschmutzung prüfen
2. **Kontakt-Sensoren**: Magnetabstand optimieren
3. **Zeitverzögerungen**: Debounce-Zeiten anpassen

### Automatik zu aggressiv
1. **Verzögerungszeiten**: Timeouts verlängern
2. **Bedingungen**: Zusätzliche Checks einbauen
3. **Deaktivierung**: Manual-Override implementieren
