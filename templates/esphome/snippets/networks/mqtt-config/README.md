# MQTT Konfiguration

## Zweck
MQTT-Broker-basierte Kommunikation als Alternative zur Home Assistant API für komplexe Netzwerk-Setups.

## Wann MQTT nutzen?
- **Kein Home Assistant**: Andere Hausautomations-Systeme
- **Mehrere Systeme**: Node-RED, OpenHAB, etc. parallel
- **Eigene Software**: Custom Applications mit MQTT
- **Netzwerk-Redundanz**: Broker als zentraler Hub
- **Cloud-Integration**: AWS IoT, Azure IoT Hub

## Secrets-Konfiguration
Erstelle `secrets.yaml`:
```yaml
mqtt_broker: "192.168.1.100"  # IP des MQTT Brokers
mqtt_username: "esphome"
mqtt_password: "dein-mqtt-passwort"
```

## Beliebte MQTT Broker
- **Mosquitto**: Lightweight, OpenSource
- **Home Assistant Mosquitto Add-on**: Einfache Integration
- **EMQX**: Enterprise-Grade, Cluster-Support
- **Cloud**: AWS IoT Core, Azure IoT Hub, HiveMQ Cloud

## Home Assistant Discovery
Mit `discovery: true` werden Geräte automatisch in Home Assistant erkannt:
- Sensoren erscheinen unter "MQTT" Integration
- Keine manuelle Konfiguration nötig
- Gleiche Funktionalität wie API

## Wichtige Einstellungen
- **client_id**: Muss für jedes Gerät eindeutig sein
- **topic_prefix**: Namespace für Gerät (z.B. "esphome/sensor01")
- **keepalive**: Verbindung am Leben halten
- **will_message**: Status bei Verbindungsabbruch

## SSL/TLS Sicherheit
```yaml
mqtt:
  port: 8883  # SSL Port
  ssl_fingerprints:
    - "AB:CD:EF:12:34:56:78:90:AB:CD:EF:12:34:56:78:90:AB:CD:EF:12"
```

## Custom MQTT Integration
- **Subscribe**: Externe Daten empfangen (Wetter, andere Sensoren)
- **Publish**: Eigene Daten senden (Custom Topics)
- **Commands**: Befehle über MQTT empfangen

## Topic-Struktur
```
esphome/device_name/sensor/temperature/state
esphome/device_name/binary_sensor/motion/state  
esphome/device_name/command/restart
esphome/device_name/status (online/offline)
```

## API vs. MQTT
| Feature | ESPHome API | MQTT |
|---------|-------------|------|
| Performance | Schneller | Langsamer |
| Latenz | Niedrig | Höher |
| Netzwerk-Last | Direkt | Via Broker |
| Kompatibilität | Nur HA | Universal |
| Sicherheit | Verschlüsselt | Konfigurierbar |
| Setup | Einfach | Komplexer |

## Debugging
- `log_topic` aktivieren für MQTT-Message-Logs
- MQTT-Explorer für Broker-Monitoring
- Mosquitto-Clients für Kommandozeilen-Tests

## Troubleshooting
- **Verbindung fehlschlägt**: Broker-IP und Port prüfen
- **Discovery funktioniert nicht**: HA MQTT Integration aktivieren
- **Messages kommen nicht an**: Topic-Namen überprüfen
- **Verbindung bricht ab**: Keepalive-Interval anpassen
