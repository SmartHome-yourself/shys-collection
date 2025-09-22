# Servo Motor

## Zweck
Präzise Positionierung für Jalousien, Klappen, Kameras, Roboterarme oder andere mechanische Anwendungen.

## Anschluss
```
Servo Wire    ESP32      Farbe (Standard)
VCC       ->  5V         Rot
GND       ->  GND        Braun/Schwarz
Signal    ->  GPIO18     Orange/Gelb
```

## Nutzung
- **Standard Hobby Servos**: SG90 (9g), MG996R (55g), etc.
- **Betriebsspannung**: 5V (manche 3.3V-tolerant)
- **PWM-Frequenz**: 50Hz (20ms Periode)
- **Pulslänge**: 1-2ms für 0°-180° Bewegung

## Steuerung
- **Number Slider**: Kontinuierliche Positionssteuerung (-100% bis +100%)
- **Buttons**: Vordefinierte Positionen (Links, Mitte, Rechts)
- **Auto-Detach**: Servo wird nach Bewegung abgeschaltet (Stromsparen)

## Wichtige Parameter
- `auto_detach_time`: Servo nach X Sekunden abschalten
- `transition_length`: Bewegungsgeschwindigkeit
- `level`: Position von -1.0 (0°) bis 1.0 (180°)

## Hinweise
- **Stromverbrauch**: Servos ziehen unter Last viel Strom (bis 2A)
- **Externe Stromversorgung**: Bei mehreren Servos separates 5V-Netzteil verwenden
- **Kalibrierung**: Manche Servos benötigen angepasste min/max-Pulslängen
- **Continuous Rotation Servos**: Verwenden `level` als Geschwindigkeit statt Position

## Anwendungsbeispiele
- Jalousien-/Rollladensteuerung
- Kamera-Schwenk-Neige-Kopf
- Automatische Türklappe
- Futterautomat
- Roboterarme
