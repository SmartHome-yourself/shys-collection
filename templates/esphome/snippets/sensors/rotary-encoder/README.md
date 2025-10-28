# Rotary Encoder

## Zweck
Drehgeber für präzise Wert-Eingabe, Lautstärke-Regelung, Menü-Navigation oder Dimmer-Steuerung.

## Anschluss (KY-040 Module)
```
Encoder   ESP32      Beschreibung
CLK   ->  GPIO18     Clock Signal (Pin A)
DT    ->  GPIO19     Data Signal (Pin B)  
SW    ->  GPIO5      Push Button
VCC   ->  3.3V       Stromversorgung
GND   ->  GND        Masse
```

## Funktionen
- **Rotation**: Erkennt Drehrichtung und Schritte
- **Push Button**: Integrierter Taster mit Click-Erkennung  
- **Position Tracking**: Absolute Position mit Min/Max-Grenzen
- **Multi-Click**: Einfach-, Doppel- und Mehrfach-Klicks

## Wichtige Parameter
- `resolution`: Impulse pro Schritt (1, 2, oder 4)
  - **1**: Für hochauflösende Encoder
  - **4**: Für Standard-Encoder (KY-040)
- `min_value`/`max_value`: Wertebereich festlegen
- `restore_mode`: Verhalten nach Neustart

## Resolution einstellen
Bei falscher Resolution können diese Probleme auftreten:
- **Zu niedrig**: Encoder "springt" über Werte
- **Zu hoch**: Mehrere Schritte für eine Änderung nötig

Test-Werte probieren: 1, 2, oder 4

## Anwendungsbeispiele

### Volume Control
```yaml
# Encoder-Werte auf Lautstärke (0-100%) mappen
lambda: |-
  float encoder_val = id(rotary_encoder).state;
  return (encoder_val + 100) / 2.0;
```

### Light Dimmer
```yaml
# Encoder direkt mit Licht-Helligkeit verknüpfen
lambda: |-
  float brightness = (id(rotary_encoder).state + 100) / 200.0;
  auto call = id(my_light).turn_on();
  call.set_brightness(brightness);
  call.perform();
```

### Menu Navigation
```yaml
# Button-Klicks für Menü-Aktionen nutzen
on_click:
  - then:
      - logger.log: "Menu item selected"
on_double_click:
  - then:
      - logger.log: "Go back in menu"
```

## Troubleshooting
- **Keine Drehung erkannt**: Pullup-Widerstände prüfen
- **Falsche Richtung**: Pin A und B vertauschen
- **Sprunghafte Werte**: Resolution anpassen
- **Button prellt**: Debounce-Zeit erhöhen
- **Encoder "läuft weg"**: Verkabelung und Störungen prüfen

## Hardware-Tipps
- **Pullup-Widerstände**: Meist bereits auf Breakout-Board vorhanden
- **Entstörung**: Kondensatoren (100nF) zwischen Pins und GND
- **Kabel-Länge**: Kurze Verbindungen für störungsfreien Betrieb
- **Mechanische Qualität**: Billige Encoder können ungenau sein

## Erweiterte Features
- **Acceleration**: Schnellere Drehung = größere Schritte
- **Relative Mode**: Nur Änderungen ohne absolute Position
- **Multiple Encoders**: Mehrere Encoder für verschiedene Parameter
- **OLED Integration**: Encoder + Display für komplette UI
