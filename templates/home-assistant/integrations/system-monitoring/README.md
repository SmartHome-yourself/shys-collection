# System Monitoring Integration

## Zweck
Umfassende Überwachung von Raspberry Pi, Servern, UPS und Netzwerk-Performance mit automatischen Alarmen bei kritischen Zuständen.

## Features
- **Hardware-Monitoring**: CPU-Temperatur, RAM, Festplatte, Load Average
- **UPS-Überwachung**: Batteriestatus, Stromausfall-Erkennung, Laufzeit
- **Netzwerk**: Internet-Geschwindigkeit, Traffic-Monitoring
- **Remote-Server**: SSH-basierte Überwachung entfernter Systeme
- **Docker**: Container-Status und Anzahl
- **Home Assistant**: Datenbank- und Log-Größe
- **Health Score**: Gesamtbewertung der Systemgesundheit
- **Automatische Alerts**: Push-Benachrichtigungen bei Problemen

## Voraussetzungen

### Lokales System (Raspberry Pi)
```bash
# Für UPS-Monitoring (APC UPS)
sudo apt-get install apcupsd

# Für Internet Speed Tests
sudo apt-get install speedtest-cli

# Für SSH-Keys (Password-less Login)
ssh-keygen -t rsa
ssh-copy-id user@remote-server
```

### SSH-Zugriff konfigurieren
```bash
# SSH-Key generieren für passwordless access
ssh-keygen -t rsa -b 4096 -f ~/.ssh/homeassistant
ssh-copy-id -i ~/.ssh/homeassistant.pub user@192.168.1.100

# SSH Config erstellen
echo "Host server
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/homeassistant
    StrictHostKeyChecking no" >> ~/.ssh/config
```

### Docker (Optional)
```bash
# Home Assistant User zur Docker-Gruppe hinzufügen
sudo usermod -aG docker homeassistant
```

## Konfiguration

### 1. UPS-Monitoring einrichten
```bash
# apcupsd konfigurieren
sudo nano /etc/apcupsd/apcupsd.conf

# Wichtige Settings:
UPSTYPE usb
NISIP 127.0.0.1
BATTERYLEVEL 20
MINUTES 5

# Service starten
sudo systemctl enable apcupsd
sudo systemctl start apcupsd

# Test
apcaccess status
```

### 2. Remote Server IP anpassen
```yaml
# In der YAML-Datei die IPs anpassen:
command: 'ssh user@192.168.1.100 "df -h /"'  # Deine Server-IP
```

### 3. Netzwerk-Interface prüfen
```bash
# Verfügbare Interfaces anzeigen
ip link show

# Häufige Interfaces:
# eth0 = Ethernet
# wlan0 = WiFi
# enp3s0 = moderne Ethernet-Namen
```

```yaml
# Im YAML anpassen:
command: "cat /sys/class/net/eth0/statistics/rx_bytes"  # Dein Interface
```

## Verfügbare Sensoren

### System-Sensoren
| Sensor | Beschreibung | Einheit | Update |
|--------|--------------|---------|--------|
| `sensor.rpi_cpu_temperature` | CPU-Temperatur | °C | 60s |
| `sensor.rpi_cpu_usage` | CPU-Auslastung | % | 30s |
| `sensor.rpi_memory_usage` | RAM-Nutzung | % | 60s |
| `sensor.rpi_disk_usage` | Festplatten-Nutzung | % | 5min |
| `sensor.rpi_uptime` | Betriebszeit | Tage | 1h |
| `sensor.rpi_load_average` | Load Average | - | 60s |

### UPS-Sensoren
| Sensor | Beschreibung | Einheit | Update |
|--------|--------------|---------|--------|
| `sensor.ups_status` | Status (ONLINE/ONBATT) | - | 60s |
| `sensor.ups_battery_level` | Batterieladung | % | 60s |
| `sensor.ups_load` | Last | % | 60s |
| `sensor.ups_time_left` | Verbleibende Zeit | min | 60s |

### Netzwerk-Sensoren
| Sensor | Beschreibung | Einheit | Update |
|--------|--------------|---------|--------|
| `sensor.internet_speed_download` | Download-Geschwindigkeit | Mbit/s | 24h |
| `sensor.internet_speed_upload` | Upload-Geschwindigkeit | Mbit/s | 24h |
| `sensor.rpi_network_download` | Aktueller Download | MB/s | 10s |

## Dashboard-Integration

### Einfache Übersicht
```yaml
type: entities
title: "System Status"
entities:
  - sensor.rpi_cpu_temperature
  - sensor.rpi_cpu_usage
  - sensor.rpi_memory_usage
  - sensor.rpi_disk_usage
  - sensor.system_health_score
```

### Erweiterte Card mit Gauges
```yaml
type: horizontal-stack
cards:
  - type: gauge
    entity: sensor.rpi_cpu_temperature
    min: 30
    max: 80
    severity:
      green: 30
      yellow: 60
      red: 70

  - type: gauge
    entity: sensor.system_health_score
    min: 0
    max: 100
    severity:
      red: 0
      yellow: 60
      green: 80
```

### UPS-Status Card
```yaml
type: conditional
conditions:
  - entity: binary_sensor.ups_on_battery
    state: "on"
card:
  type: markdown
  content: |
    ## ⚡ STROMAUSFALL
    
    **Batterie:** {{ states('sensor.ups_battery_level') }}%
    **Verbleibend:** {{ states('sensor.ups_time_left') }} Minuten
    **Last:** {{ states('sensor.ups_load') }}%
  card_mod:
    style: |
      ha-card {
        background-color: #f44336;
        color: white;
        animation: blink 1s infinite;
      }
```

## Erweiterte Konfiguration

### Dynamische Schwellenwerte
```yaml
# Template für anpassbare Alarme
binary_sensor:
  - platform: template
    sensors:
      rpi_cpu_alert:
        value_template: >
          {{ states('sensor.rpi_cpu_usage') | float > 
             states('input_number.system_alert_cpu_threshold') | float }}
```

### Mehrere Server überwachen
```yaml
# Server-Liste als Input Select
input_select:
  monitored_servers:
    name: "Überwachte Server"
    options:
      - "192.168.1.100"
      - "192.168.1.101"
      - "192.168.1.102"

# Template-Sensor für dynamische IP
sensor:
  - platform: command_line
    name: "Selected Server CPU"
    command_template: >
      ssh user@{{ states('input_select.monitored_servers') }} "top -bn1 | grep 'Cpu(s)' | awk '{print $2}' | cut -d'%' -f1"
```

### Log-Rotation überwachen
```yaml
sensor:
  - platform: command_line
    name: "Old Log Files"
    command: 'find /config -name "*.log.*" -mtime +7 | wc -l'
    scan_interval: 3600

automation:
  - alias: "Log Cleanup"
    trigger:
      platform: numeric_state
      entity_id: sensor.old_log_files
      above: 10
    action:
      - service: shell_command.cleanup_old_logs

shell_command:
  cleanup_old_logs: 'find /config -name "*.log.*" -mtime +7 -delete'
```

## Performance-Optimierung

### Längere Scan-Intervalle für Stabilität
```yaml
# Kritische Werte: häufiger
sensor:
  - platform: command_line
    scan_interval: 30  # CPU, RAM
    
# Unkritische Werte: seltener  
sensor:
  - platform: command_line
    scan_interval: 300  # Disk, Uptime
```

### SSH Connection Reuse
```bash
# SSH Config optimieren
echo "ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p
ControlPersist 600" >> ~/.ssh/config
```

### Caching für langsame Commands
```yaml
# Speed Test nur bei Bedarf
automation:
  - alias: "Speed Test bei schlechter Performance"
    trigger:
      platform: numeric_state
      entity_id: sensor.rpi_load_average
      above: 2
      for: "00:05:00"
    action:
      - service: script.run_speed_test
```

## Troubleshooting

### SSH-Probleme
```bash
# SSH-Verbindung testen
ssh -v user@server

# Key-Probleme
ssh-add ~/.ssh/homeassistant

# Permissions prüfen
chmod 600 ~/.ssh/homeassistant
chmod 700 ~/.ssh
```

### Command Line Sensoren funktionieren nicht
```bash
# Kommandos manuell testen
/bin/bash -c "cat /sys/class/thermal/thermal_zone0/temp"

# Pfade prüfen (je nach System unterschiedlich)
ls /sys/class/thermal/
```

### UPS nicht erkannt
```bash
# USB-Geräte prüfen
lsusb | grep APC

# apcupsd Status
sudo systemctl status apcupsd

# Log prüfen
sudo tail -f /var/log/apcupsd.events
```

### Performance-Probleme
```yaml
# Command Line Timeouts erhöhen
sensor:
  - platform: command_line
    command_timeout: 30
    scan_interval: 120
```

## Sicherheit

### SSH-Härtung
```bash
# SSH Config für Home Assistant
echo "Protocol 2
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
AllowUsers homeassistant" | sudo tee -a /etc/ssh/sshd_config
```

### Sudo-Rechte minimieren
```bash
# Nur spezifische Commands erlauben
echo "homeassistant ALL=(ALL) NOPASSWD: /bin/systemctl status *" | sudo tee /etc/sudoers.d/homeassistant
```

### Monitoring-Data verschlüsseln
```yaml
# Sensitive Daten ausblenden
sensor:
  - platform: command_line
    name: "Server Status"
    command: 'ssh server "echo OK"'  # Nur Verfügbarkeit, keine Details
```
