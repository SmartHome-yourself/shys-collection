# HC-SR04 Ultraschall Distanzsensor

## Zweck
Berührungslose Entfernungsmessung für Füllstandsanzeigen, Parksensoren oder Anwesenheitserkennung.

## Nutzung
- **Messbereich**: 2cm bis 400cm
- **Genauigkeit**: ±3mm
- **Stromverbrauch**: ~15mA (nur während Messung)
- **Betriebsspannung**: 5V (funktioniert meist auch mit 3.3V)

## Anschluss
```
HC-SR04   ESP32
VCC   ->  5V (oder 3.3V)
GND   ->  GND
Trig  ->  GPIO5
Echo  ->  GPIO18
```

## Hinweise
- Filter sind wichtig für stabile Messwerte
- `timeout` verhindert hängende Messungen
- Sensor funktioniert am besten bei glatten, senkrechten Oberflächen
- Bei weichen Materialien (Stoff, Schaum) können Messungen ungenau sein
- Für präzise Messungen: Sensor waagerecht montieren

## Anwendungsbeispiele
- Wassertank-Füllstand
- Parkplatz-Belegung
- Automatische Mülltonne-Erkennung
- Näherungsschalter für Beleuchtung
