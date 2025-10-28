# DS18B20 Temperatursensor

## Zweck
Präzise digitale Temperaturmessung mit OneWire-Protokoll. Ideal für Wasserthermometer, Außentemperatur oder Multi-Sensor-Setups.

## Anschluss
```
DS18B20   ESP32      Beschreibung
VCC   ->  3.3V       Stromversorgung
GND   ->  GND        Masse
DATA  ->  GPIO4      OneWire Datenleitung + 4.7kΩ Pullup zu 3.3V
```

## Schaltung mit Pullup
```
3.3V ---- [4.7kΩ] ---- GPIO4 ---- DS18B20 DATA
                        |
                     [DS18B20]
                        |
                       GND
```

## Sensor-Adresse finden
1. **Temporäres YAML** mit discovery verwenden:
```yaml
dallas:
  - pin: GPIO4

# Sensor-Adressen anzeigen
logger:
  level: DEBUG
```

2. **Log prüfen** nach dem Flashen:
```
[D][dallas:058]: Found sensors:
[D][dallas:060]:   0x1c0000031edd2a28
```

3. **Adresse kopieren** in die finale Konfiguration

## Mehrere Sensoren
```yaml
dallas:
  - pin: GPIO4
    update_interval: 10s

sensor:
  - platform: dallas
    address: 0x1c0000031edd2a28
    name: "Außentemperatur"
  
  - platform: dallas  
    address: 0x2d0000031f7e4a28
    name: "Innentemperatur"
    
  - platform: dallas
    address: 0x3e0000031a8b1b28
    name: "Wassertemperatur"
```

## Wichtige Parameter
- **resolution**: 9-12 Bit (9=0.5°C, 12=0.0625°C)
- **update_interval**: Messintervall (mindestens 1s)
- **address**: Eindeutige 64-Bit Sensor-ID
- **Pullup**: 4.7kΩ zwischen DATA und VCC zwingend erforderlich

## Auflösung vs. Geschwindigkeit
| Auflösung | Genauigkeit | Messzeit |
|-----------|-------------|----------|
| 9 Bit     | 0.5°C       | 94ms     |
| 10 Bit    | 0.25°C      | 188ms    |
| 11 Bit    | 0.125°C     | 375ms    |
| 12 Bit    | 0.0625°C    | 750ms    |

## Vorteile DS18B20
- **Digital**: Keine ADC-Probleme oder Rauschen
- **Präzise**: ±0.5°C Genauigkeit
- **OneWire**: Mehrere Sensoren an einem Pin
- **Weite Bereiche**: -55°C bis +125°C
- **Parasitär**: Funktioniert ohne extra VCC-Leitung

## Wasserdichte Varianten
- **DS18B20 Sonde**: Edelstahlhülle, 1-3m Kabel
- **Schrumpfschlauch**: Zusätzlicher Schutz
- **Abdichtung**: Kabeleinführung mit Silikon

## Anwendungsbeispiele
- Pool-/Aquariumtemperatur
- Heizungsvorlauf/-rücklauf
- Außentemperatur (wetterfest)
- Kühlschranküberwachung
- Mehrpunkt-Temperaturmessung

## Troubleshooting
- **Kein Sensor gefunden**: Pullup-Widerstand prüfen
- **Falsche Werte**: Verkabelung/Kontakte überprüfen
- **Zeitüberschreitung**: Update-Intervall zu kurz
- **Parasitärmodus**: Separate VCC-Leitung verwenden
