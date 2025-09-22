# BME280 Sensor

## Zweck
Temperatur-, Luftfeuchtigkeits- und Luftdrucksensor für Wetterstation, Raumklima-Überwachung oder Höhenmessung.

## Nutzung
- **I²C-Verbindung erforderlich**: SDA/SCL Pins + 3.3V/GND
- **Adresse**: Standardmäßig 0x76, manche Module nutzen 0x77
- **Pullup-Widerstände**: 4.7kΩ zwischen SDA/SCL und 3.3V (oft bereits auf Board vorhanden)

## Hinweise
- Sehr genauer und stabiler Sensor
- Niedrigerer Stromverbrauch als DHT22
- Kalibrierung über `offset` Filter möglich
- Bei mehreren I²C-Sensoren: `scan: true` aktivieren zur Adresserkennung

## Beispiel I²C-Konfiguration
```yaml
i2c:
  sda: GPIO21  # ESP32
  scl: GPIO22  # ESP32
  scan: true
```

## Pinout
```
BME280    ESP32
VCC   ->  3.3V
GND   ->  GND
SDA   ->  GPIO21
SCL   ->  GPIO22
```
