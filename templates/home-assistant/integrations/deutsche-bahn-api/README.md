# Deutsche Bahn API Integration

## Zweck
Echtzeit-Zugdaten für Pendler mit Abfahrtszeiten, Verspätungen, Verbindungssuche und Störungsmeldungen direkt von der Deutschen Bahn.

## Features
- **Echtzeit-Abfahrten**: Aktuelle Zugdaten von konfigurierbaren Bahnhöfen
- **Verbindungssuche**: Automatische Routenplanung für Pendlerstrecken
- **Verspätungs-Alarme**: Push-Benachrichtigungen bei Verzögerungen
- **Facility-Status**: Aufzug- und Rolltreppe-Überwachung
- **Pendler-Modus**: Automatische Benachrichtigungen zu Pendelzeiten
- **Bahnhofsinfos**: Details zu Ausstattung und Services
- **Statistiken**: Monatliche Verspätungsanalyse

## Voraussetzungen

### DB API-Schlüssel beantragen
1. Registrierung auf [Deutsche Bahn Developer Portal](https://developers.deutschebahn.com/)
2. Kostenloser API-Key für private Nutzung
3. APIs abonnieren:
   - **Timetables** (Fahrpläne)
   - **StaDa** (Bahnhofsdaten)
   - **FaSta** (Aufzugsstatus)

### Secrets-Konfiguration
```yaml
# secrets.yaml
db_api_key: "Bearer DEIN_API_SCHLUESSEL_HIER"
```

### Bahnhofs-IDs finden
Bahnhofs-IDs sind 7-stellige EVA-Nummern:
- **Frankfurt Hbf**: 8000105
- **München Hbf**: 8000261
- **Berlin Hbf**: 8011160
- **Hamburg Hbf**: 8002549
- **Köln Hbf**: 8000207

[Vollständige Liste der Bahnhöfe](https://data.deutschebahn.com/dataset/data-stationsdaten)

## Konfiguration

### 1. Bahnhöfe konfigurieren
```yaml
# In der Integration oder über UI:
input_text:
  db_home_station_id:
    initial: "8000105"  # Deine Heimat-Station
  db_work_station_id:
    initial: "8000261"  # Deine Arbeitsplatz-Station
```

### 2. Pendlerzeiten anpassen
```yaml
# In den Automatisierungen:
trigger:
  - platform: time
    at: "07:00:00"  # Morgendliche Info-Zeit anpassen

binary_sensor:
  db_commute_time:
    value_template: >
      {% set morning_commute = 630 <= now_time <= 930 %}  # 06:30-09:30
      {% set evening_commute = 1630 <= now_time <= 1930 %} # 16:30-19:30
```

### 3. Verspätungs-Schwelle anpassen
```yaml
input_number:
  db_delay_threshold:
    initial: 10  # Alarm ab 10 Minuten Verspätung
```

## Verfügbare Sensoren

### Basis-Sensoren
| Sensor | Beschreibung | Update |
|--------|--------------|--------|
| `sensor.db_abfahrten_heimat` | Abfahrten Heimatbahnhof | 5min |
| `sensor.db_abfahrten_arbeit` | Abfahrten Arbeitsplatz | 5min |
| `sensor.db_verbindung_hinfahrt` | Verbindung zur Arbeit | 10min |
| `sensor.db_verbindung_rückfahrt` | Verbindung nach Hause | 15min |
| `sensor.db_station_info_heimat` | Bahnhofsinformationen | 24h |
| `sensor.db_facilities_status` | Aufzug-/Rolltreppe-Status | 10min |

### Template-Sensoren
| Sensor | Beschreibung |
|--------|--------------|
| `sensor.db_next_departure_time` | Nächste Abfahrtszeit |
| `sensor.db_next_departure_platform` | Nächster Bahnsteig |
| `sensor.db_next_departure_destination` | Nächstes Ziel |
| `sensor.db_commute_duration` | Arbeitsweg-Dauer |
| `sensor.db_commute_changes` | Anzahl Umstiege |
| `sensor.db_total_delay` | Gesamtverspätung heute |

### Binäre Sensoren
| Sensor | Beschreibung |
|--------|--------------|
| `binary_sensor.db_significant_delay` | Erhebliche Verspätung |
| `binary_sensor.db_elevator_outage` | Aufzug-Ausfall |
| `binary_sensor.db_connection_available` | Verbindung verfügbar |
| `binary_sensor.db_commute_time` | Pendelzeit aktiv |

## Dashboard-Integration

### Einfache Abfahrts-Card
```yaml
type: entities
title: "🚆 Nächste Züge"
entities:
  - sensor.db_next_departure_time
  - sensor.db_next_departure_platform
  - sensor.db_next_departure_destination
  - sensor.db_commute_duration
```

### Erweiterte Pendler-Card
```yaml
type: vertical-stack
cards:
  - type: markdown
    content: |
      ## 🚆 Pendler-Info
      
      **Nächste Abfahrt:** {{ states('sensor.db_next_departure_time') }}
      **Bahnsteig:** {{ states('sensor.db_next_departure_platform') }}
      **Ziel:** {{ states('sensor.db_next_departure_destination') }}
      
      **Arbeitsweg:** {{ states('sensor.db_commute_duration') }} 
      ({{ states('sensor.db_commute_changes') }} Umstiege)
      
      {% if states('sensor.db_total_delay') | float > 0 %}
      ⚠️ **Verspätung:** {{ states('sensor.db_total_delay') }} Minuten
      {% endif %}

  - type: conditional
    conditions:
      - entity: binary_sensor.db_elevator_outage
        state: "on"
    card:
      type: markdown
      content: |
        ## ♿ Aufzug außer Betrieb
        Bitte alternative Route planen!
      card_mod:
        style: |
          ha-card {
            background-color: #ff9800;
            color: white;
          }
```

### Statistik-Card
```yaml
type: history-graph
title: "Verspätungen letzte Woche"
hours_to_show: 168
entities:
  - sensor.db_total_delay
  - sensor.db_delays_monthly
```

## Erweiterte Features

### Alternative Routen
```yaml
# Weitere Verbindungsoptionen
sensor:
  - platform: rest
    name: "DB Alternative Route"
    resource_template: >
      https://apis.deutschebahn.com/db-api-marketplace/apis/timetables/v1/journey/{{ states('input_text.db_home_station_id') }}/{{ states('input_text.db_work_station_id') }}/{{ (now() + timedelta(minutes=60)).strftime('%y%m%d/%H%M') }}?transfers=2
```

### Wetter-Integration
```yaml
automation:
  - alias: "Regen-Warnung für Bahnfahrt"
    trigger:
      platform: numeric_state
      entity_id: sensor.rain_forecast_next_hour
      above: 2  # mm Regen
    condition:
      condition: state
      entity_id: binary_sensor.db_commute_time
      state: "on"
    action:
      service: notify.mobile_app
      data:
        title: "☔ Regen zur Abfahrtszeit"
        message: "Regenschirm nicht vergessen!"
```

### Slack/Teams Integration
```yaml
automation:
  - alias: "Team-Info bei Verspätung"
    trigger:
      platform: numeric_state
      entity_id: sensor.db_total_delay
      above: 20
    action:
      service: notify.slack
      data:
        message: "Komme {{ states('sensor.db_total_delay') }} Min. später - Bahnverspätung 🚆"
        target: "#team-channel"
```

### Kalender-Integration
```yaml
# Automatische Erinnerung vor Terminen
automation:
  - alias: "DB Info vor Kalender-Termin"
    trigger:
      platform: calendar
      entity_id: calendar.work
      event: start
      offset: "-01:30:00"  # 1.5h vor Termin
    action:
      service: script.db_search_connection
      data:
        from_station: "{{ states('input_text.db_home_station_id') }}"
        to_station: "{{ states('input_text.db_work_station_id') }}"
```

## Performance-Optimierung

### API-Limits beachten
```yaml
# Längere Scan-Intervalle bei weniger kritischen Daten
sensor:
  - platform: rest
    scan_interval: 300  # Abfahrten: 5min
  - platform: rest
    scan_interval: 86400  # Bahnhofsinfo: 24h
```

### Bedingte Updates
```yaml
automation:
  - alias: "DB Updates nur zu Pendelzeiten"
    trigger:
      platform: time_pattern
      minutes: "/5"
    condition:
      condition: state
      entity_id: binary_sensor.db_commute_time
      state: "on"
    action:
      service: homeassistant.update_entity
      target:
        entity_id: 
          - sensor.db_abfahrten_heimat
          - sensor.db_verbindung_hinfahrt
```

### Caching implementieren
```yaml
# Template mit Fallback für API-Ausfälle
sensor:
  - platform: template
    sensors:
      db_departure_cached:
        value_template: >
          {% if states('sensor.db_next_departure_time') != 'unavailable' %}
            {{ states('sensor.db_next_departure_time') }}
          {% else %}
            {{ states('input_text.db_last_known_departure') }}
          {% endif %}
```

## Troubleshooting

### API-Probleme
```bash
# API-Zugriff testen
curl -H "Authorization: Bearer DEIN_API_KEY" \
  "https://apis.deutschebahn.com/db-api-marketplace/apis/timetables/v1/station/8000105"
```

### Häufige Fehler
1. **401 Unauthorized**: API-Key falsch oder abgelaufen
2. **404 Not Found**: Bahnhofs-ID existiert nicht
3. **429 Too Many Requests**: API-Limit überschritten

### Logs prüfen
```yaml
logger:
  logs:
    homeassistant.components.rest: debug
    homeassistant.components.template: debug
```

### Backup-Strategie
```yaml
# Fallback bei API-Ausfall
automation:
  - alias: "DB API Fallback"
    trigger:
      platform: state
      entity_id: sensor.db_abfahrten_heimat
      to: "unavailable"
      for: "00:10:00"
    action:
      service: notify.mobile_app
      data:
        title: "⚠️ DB API nicht erreichbar"
        message: "Prüfe Fahrplan manuell in der DB App"
```

## Datenschutz

### Lokale Verarbeitung
- Alle API-Calls erfolgen direkt von Home Assistant
- Keine Übertragung persönlicher Daten an Dritte
- Nur öffentliche Fahrplandaten werden abgerufen

### API-Nutzung
- Offizielle Deutsche Bahn API
- Kostenlos für private Nutzung
- Gleiche Daten wie in DB-Apps verfügbar

### Speicherung
```yaml
# Minimale Datenspeicherung
recorder:
  exclude:
    entities:
      - sensor.db_abfahrten_heimat  # Nicht dauerhaft speichern
      - sensor.db_abfahrten_arbeit
```
