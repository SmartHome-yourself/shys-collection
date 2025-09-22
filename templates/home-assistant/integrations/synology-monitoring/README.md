# Synology NAS Monitoring Integration

## Zweck
Umfassende Überwachung von Synology DiskStation NAS-Systemen mit System-Monitoring, Speicher-Überwachung, Service-Status und automatischen Alarmen.

## Features
- **System-Performance**: CPU, RAM, Netzwerk-Traffic
- **Speicher-Monitoring**: Festplatten-Status, Kapazität, Gesundheit
- **Service-Überwachung**: DSM-Services, Download Station
- **Temperatur-Kontrolle**: Überhitzungsschutz
- **Automatische Alarme**: Push-Benachrichtigungen bei Problemen
- **Tägliche Reports**: Status-Zusammenfassung
- **Netzwerk-Statistiken**: Traffic-Analyse und Trends

## Voraussetzungen

### Synology DSM Konfiguration

#### 1. Web API aktivieren
```
DSM → Systemsteuerung → Terminal & SNMP → Web API aktivieren
```

#### 2. SNMP aktivieren (Optional)
```
DSM → Systemsteuerung → Terminal & SNMP → SNMP aktivieren
Community: public (oder eigenen Namen setzen)
SNMP v1, v2c aktivieren
```

#### 3. Benutzer-Account (Empfohlen)
```
DSM → Systemsteuerung → Benutzer → Erstellen
Name: homeassistant
Gruppe: administrators (für API-Zugriff)
Oder: Nur benötigte Rechte vergeben
```

### Home Assistant Konfiguration

#### secrets.yaml
```yaml
# Optional für authentifizierte API-Calls
synology_username: "homeassistant"
synology_password: "dein_passwort"
```

## Konfiguration

### 1. IP-Adresse anpassen
```yaml
# In allen REST-Sensoren die IP ändern:
resource: "http://192.168.1.200:5000/webapi/entry.cgi"  # Deine NAS-IP

# Für SNMP:
host: 192.168.1.200  # Deine NAS-IP
```

### 2. SNMP Community anpassen
```yaml
# Falls andere Community verwendet:
sensor:
  - platform: snmp
    community: "deine_community"  # statt "public"
```

### 3. Authentifizierung (Optional)
```yaml
# Für authentifizierte API-Calls:
sensor:
  - platform: rest
    resource: "http://192.168.1.200:5000/webapi/auth.cgi"
    method: POST
    payload: >
      api=SYNO.API.Auth&version=3&method=login&account={{ synology_username }}&passwd={{ synology_password }}&session=HomeAssistant&format=sid
```

## Verfügbare Sensoren

### System-Performance
| Sensor | Beschreibung | Update | Einheit |
|--------|--------------|--------|---------|
| `sensor.synology_cpu_usage` | CPU-Auslastung | 60s | % |
| `sensor.synology_memory_usage` | RAM-Nutzung | 60s | % |
| `sensor.synology_network_rx` | Netzwerk Download | 30s | MB/s |
| `sensor.synology_network_tx` | Netzwerk Upload | 30s | MB/s |
| `sensor.synology_temperature_snmp` | System-Temperatur | 5min | °C |

### Speicher & Festplatten
| Sensor | Beschreibung | Update | Einheit |
|--------|--------------|--------|---------|
| `sensor.synology_storage_info` | Volume-Informationen | 5min | Volumes |
| `sensor.synology_disk_info` | Festplatten-Status | 10min | OK |
| `sensor.synology_disk_usage_percent` | Speicher-Nutzung | berechnet | % |
| `sensor.synology_disk_free_gb` | Freier Speicher | berechnet | GB |
| `sensor.synology_healthy_disks` | Gesunde Festplatten | berechnet | Anzahl |

### Services & Downloads
| Sensor | Beschreibung | Update | Einheit |
|--------|--------------|--------|---------|
| `sensor.synology_dsm_services` | Aktive Services | 5min | Services |
| `sensor.synology_download_station` | Download Station Version | 1h | - |
| `sensor.synology_active_downloads` | Aktive Downloads | 2min | Downloads |

### Status-Sensoren
| Sensor | Beschreibung |
|--------|--------------|
| `sensor.synology_system_status` | Gesamtstatus (Normal/Warnung/Kritisch) |
| `binary_sensor.synology_high_cpu_usage` | Hohe CPU-Last |
| `binary_sensor.synology_low_disk_space` | Wenig Speicherplatz |
| `binary_sensor.synology_disk_failure` | Festplatten-Problem |
| `binary_sensor.synology_offline` | NAS nicht erreichbar |

## Dashboard-Integration

### Basis-Übersicht
```yaml
type: entities
title: "📦 Synology NAS"
entities:
  - sensor.synology_system_status
  - sensor.synology_cpu_usage
  - sensor.synology_memory_usage
  - sensor.synology_disk_usage_percent
  - sensor.synology_temperature_snmp
```

### Erweiterte NAS-Card
```yaml
type: vertical-stack
cards:
  - type: horizontal-stack
    cards:
      - type: gauge
        entity: sensor.synology_cpu_usage
        min: 0
        max: 100
        severity:
          green: 0
          yellow: 70
          red: 85

      - type: gauge
        entity: sensor.synology_memory_usage
        min: 0
        max: 100
        severity:
          green: 0
          yellow: 80
          red: 90

      - type: gauge
        entity: sensor.synology_disk_usage_percent
        min: 0
        max: 100
        severity:
          green: 0
          yellow: 70
          red: 85

  - type: entities
    title: "Storage Details"
    entities:
      - sensor.synology_disk_free_gb
      - sensor.synology_healthy_disks
      - sensor.synology_active_downloads
      - binary_sensor.synology_offline
```

### Alarm-Card
```yaml
type: conditional
conditions:
  - entity: sensor.synology_system_status
    state_not: "Normal"
card:
  type: markdown
  content: |
    ## ⚠️ NAS Problem erkannt
    
    **Status:** {{ states('sensor.synology_system_status') }}
    
    {% if is_state('binary_sensor.synology_high_cpu_usage', 'on') %}
    🔥 **Hohe CPU-Last:** {{ states('sensor.synology_cpu_usage') }}%
    {% endif %}
    
    {% if is_state('binary_sensor.synology_low_disk_space', 'on') %}
    💾 **Wenig Speicher:** {{ states('sensor.synology_disk_free_gb') }}GB frei
    {% endif %}
    
    {% if is_state('binary_sensor.synology_disk_failure', 'on') %}
    🚨 **Festplatten-Problem:** Prüfung erforderlich
    {% endif %}
  card_mod:
    style: |
      ha-card {
        background-color: #ff9800;
        color: white;
      }
```

## Erweiterte Funktionen

### Authentifizierte API-Calls
```yaml
# Session-basierte Authentifizierung
rest_command:
  synology_login:
    url: "http://192.168.1.200:5000/webapi/auth.cgi"
    method: POST
    payload: >
      api=SYNO.API.Auth&version=3&method=login&account={{ synology_username }}&passwd={{ synology_password }}&session=HomeAssistant&format=sid

# Erweiterte DSM-APIs
sensor:
  - platform: rest
    name: "Synology Package List"
    resource: "http://192.168.1.200:5000/webapi/entry.cgi"
    method: POST
    payload: 'api=SYNO.Core.Package&version=1&method=list'
```

### Docker Container Monitoring
```yaml
# Falls Docker Package installiert
sensor:
  - platform: rest
    name: "Synology Docker Containers"
    resource: "http://192.168.1.200:5000/webapi/entry.cgi"
    method: POST
    payload: 'api=SYNO.Docker.Container&version=1&method=list'
    value_template: >
      {% if value_json.success %}
        {{ value_json.data.containers | selectattr('status', 'equalto', 'running') | list | length }}
      {% else %}
        0
      {% endif %}
    unit_of_measurement: "Container"
```

### Backup-Status überwachen
```yaml
sensor:
  - platform: rest
    name: "Synology Backup Tasks"
    resource: "http://192.168.1.200:5000/webapi/entry.cgi"
    method: POST
    payload: 'api=SYNO.Backup.Task&version=1&method=list'
    value_template: >
      {% if value_json.success %}
        {{ value_json.data.task_list | selectattr('status', 'equalto', 'Success') | list | length }}
      {% else %}
        0
      {% endif %}
```

### UPS-Integration
```yaml
# Falls UPS angeschlossen
sensor:
  - platform: snmp
    host: 192.168.1.200
    community: public
    baseoid: 1.3.6.1.4.1.6574.4.1.1.0
    name: "Synology UPS Status"
    scan_interval: 300

  - platform: snmp
    host: 192.168.1.200
    community: public
    baseoid: 1.3.6.1.4.1.6574.4.2.1.0
    name: "Synology UPS Battery"
    unit_of_measurement: "%"
    device_class: battery
```

## Automatisierungen

### Intelligente Backup-Erinnerung
```yaml
automation:
  - alias: "Synology Backup Reminder"
    trigger:
      platform: time
      at: "20:00:00"
    condition:
      - condition: template
        value_template: >
          {{ (now() - states.sensor.synology_backup_tasks.last_changed).days > 7 }}
    action:
      service: notify.mobile_app
      data:
        title: "💾 Backup Erinnerung"
        message: "Letztes erfolgreiches Backup vor {{ (now() - states.sensor.synology_backup_tasks.last_changed).days }} Tagen"
```

### Energiespar-Automatik
```yaml
automation:
  - alias: "Synology Energiesparen"
    trigger:
      platform: time
      at: "23:00:00"
    condition:
      condition: numeric_state
      entity_id: sensor.synology_active_downloads
      below: 1
    action:
      # Hibernate-Modus aktivieren (falls unterstützt)
      service: rest_command.synology_hibernate
```

### Service-Neustart bei Problemen
```yaml
automation:
  - alias: "Synology Service Auto-Restart"
    trigger:
      platform: state
      entity_id: binary_sensor.synology_high_cpu_usage
      to: "on"
      for: "00:15:00"
    action:
      - service: script.synology_restart_services
      - delay: 300
      - condition: state
        entity_id: binary_sensor.synology_high_cpu_usage
        state: "off"
      - service: notify.mobile_app
        data:
          title: "🔄 Services neugestartet"
          message: "Synology Services wurden automatisch neugestartet"
```

## Troubleshooting

### API-Verbindungsprobleme
```bash
# API-Zugriff testen
curl -X POST "http://192.168.1.200:5000/webapi/entry.cgi" \
  -d "api=SYNO.API.Info&version=1&method=query&query=all"
```

### SNMP-Probleme
```bash
# SNMP-Walk testen
snmpwalk -v2c -c public 192.168.1.200 1.3.6.1.4.1.6574.1.2.0
```

### Häufige Fehler
1. **HTTP 400**: Falsche API-Parameter
2. **HTTP 403**: Keine Berechtigung/falsches Passwort
3. **HTTP 404**: API nicht verfügbar/deaktiviert
4. **Timeout**: Firewall oder Netzwerk-Problem

### Debug-Logs
```yaml
logger:
  logs:
    homeassistant.components.rest: debug
    homeassistant.components.snmp: debug
```

### Firewall-Einstellungen
```
DSM → Systemsteuerung → Sicherheit → Firewall
Regel erstellen:
- Quelle: Home Assistant IP
- Port: 5000 (HTTP), 161 (SNMP)
- Protokoll: TCP/UDP
```

## Sicherheit

### API-Sicherheit
```yaml
# Eigenen API-Benutzer mit minimalen Rechten erstellen
# Nur notwendige APIs aktivieren
# HTTPS verwenden (Port 5001)
resource: "https://192.168.1.200:5001/webapi/entry.cgi"
verify_ssl: false  # Bei Self-Signed Certificates
```

### SNMP-Härtung
```
# Community-String ändern
# SNMP v3 mit Authentifizierung verwenden
# Zugriff nur von Home Assistant IP erlauben
```

### Monitoring-Limits
```yaml
# Zu häufige API-Calls vermeiden
sensor:
  - platform: rest
    scan_interval: 300  # Mindestens 5 Minuten bei nicht-kritischen Daten

# Nur relevante Daten überwachen
recorder:
  include:
    entities:
      - sensor.synology_cpu_usage
      - sensor.synology_disk_usage_percent
  exclude:
    entities:
      - sensor.synology_network_rx  # Zu viele Datenpunkte
```
