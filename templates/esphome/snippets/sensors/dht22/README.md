# Basic Temperature & Humidity Sensor

Ein einfacher und zuverlässiger Temperatur- und Feuchtigkeitssensor für ESPHome mit Home Assistant Integration.

## 📋 Hardware

### Benötigte Komponenten
- ESP32 oder ESP8266 Development Board
- DHT22 (AM2302) Temperatur- und Feuchtigkeitssensor
- 10kΩ Pullup-Widerstand (optional, meist im DHT22 integriert)
- Breadboard oder PCB
- Jumper-Kabel

### Optionale Komponenten
- Gehäuse (IP54+ für Außeneinsatz)
- Externe WiFi-Antenne

## 🔌 Verkabelung

```
ESP32/ESP8266    DHT22
GND         -->  GND (Pin 4)
3.3V        -->  VCC (Pin 1)
GPIO4       -->  DATA (Pin 2)
             -->  NC (Pin 3 - nicht verbinden)
```

**Wichtig**: Bei längeren Kabeln (>1m) sollte ein 10kΩ Pullup-Widerstand zwischen VCC und DATA-Pin verwendet werden.

## ⚙️ Installation

### 1. Repository klonen
```bash
git clone https://github.com/your-username/shys-platinen-templates.git
cd shys-platinen-templates/templates/esphome/basic/temp-humidity-sensor
```

### 2. Secrets konfigurieren
```bash
cp secrets.yaml.example secrets.yaml
# secrets.yaml bearbeiten und eigene Zugangsdaten eintragen
```

### 3. ESPHome flashen
```bash
esphome run temp-humidity-sensor.yaml
```

## 🏠 Home Assistant Integration

Nach dem ersten Flash wird der Sensor automatisch in Home Assistant erkannt. Falls nicht:

1. Zu **Einstellungen** > **Geräte & Dienste** > **Integrationen**
2. **ESPHome** auswählen
3. Gerät hinzufügen mit der IP-Adresse des ESP

### Beispiel Lovelace-Karte
```yaml
type: entities
title: Klimasensor Wohnzimmer
entities:
  - entity: sensor.temperature_sensor_temperature
    name: Temperatur
  - entity: sensor.temperature_sensor_humidity
    name: Luftfeuchtigkeit
  - entity: binary_sensor.temperature_sensor_status
    name: Online Status
```

## 🔧 Konfiguration

### GPIO-Pins anpassen
Ändere in der YAML-Datei den Pin für den DHT22:
```yaml
sensor:
  - platform: dht
    pin: GPIO4  # Ändere hier den Pin
```

### Kalibrierung
Für präzise Messungen kannst du Offsets einstellen:
```yaml
temperature:
  filters:
    - offset: -0.5  # Temperatur um 0.5°C reduzieren
humidity:
  filters:
    - offset: 2.0   # Luftfeuchtigkeit um 2% erhöhen
```

### Update-Intervall
Standard ist 60 Sekunden. Für häufigere Updates:
```yaml
sensor:
  - platform: dht
    update_interval: 30s  # Alle 30 Sekunden
```

## 🐛 Troubleshooting

### Sensor wird nicht erkannt
- Verkabelung prüfen
- 10kΩ Pullup-Widerstand hinzufügen
- Anderen GPIO-Pin testen

### Unplausible Werte
- DHT22 kann bei schnellen Temperaturänderungen springen
- `sliding_window_average` Filter bereits aktiv
- Sensor vor direkter Sonneneinstrahlung schützen

### WiFi-Verbindungsprobleme
- Fallback-Hotspot aktiviert sich automatisch
- SSID: "Temperature Sensor Fallback"
- Passwort: Siehe secrets.yaml

## 📊 Technische Daten

- **Temperaturbereich**: -40°C bis +80°C (±0.5°C)
- **Feuchtigkeitsbereich**: 0-100% RH (±2-5%)
- **Stromverbrauch**: ~80mA aktiv, ~10µA Deep Sleep
- **Update-Rate**: 0.5 Hz (alle 2 Sekunden möglich)

## 🔗 Weiterführende Links

- [ESPHome DHT Dokumentation](https://esphome.io/components/sensor/dht.html)
- [DHT22 Datenblatt](https://www.sparkfun.com/datasheets/Sensors/Temperature/DHT22.pdf)
- [SHYs-Platinen Community Discord](https://discord.gg/your-server)

## 📝 Changelog

### v1.2.0 (2025-08-10)
- Home Assistant Device Classes hinzugefügt
- Diagnostic Entity Categories
- Web Server für Debugging
- Verbesserte Dokumentation

### v1.1.0 (2025-08-05)
- Sliding Window Average Filter
- Kalibrierungs-Support
- Status LED Integration

### v1.0.0 (2025-08-01)
- Erste stabile Version
- Basic DHT22 Integration
- WiFi Fallback Support