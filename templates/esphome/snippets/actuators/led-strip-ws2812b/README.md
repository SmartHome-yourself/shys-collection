# WS2812B/NeoPixel LED Strip

## Zweck
Adressierbare RGB-LED-Streifen für Ambiente-Beleuchtung, Effekte, Benachrichtigungen oder dekorative Anwendungen.

## Anschluss
```
LED Strip    ESP32       Hinweise
VCC      ->  5V          Separates Netzteil bei >10 LEDs
GND      ->  GND         Gemeinsame Masse wichtig!
DIN      ->  GPIO5       Datenleitung
```

## Stromversorgung
⚠️ **Wichtig**: LED-Strips brauchen viel Strom!
- **Pro LED**: ~60mA bei voller Helligkeit (Weiß)
- **30 LEDs**: bis zu 1.8A bei 5V
- **Ab 10+ LEDs**: Separates 5V-Netzteil verwenden
- **Kondensator**: 1000µF zwischen VCC/GND (nahe am Strip)

## Parameter anpassen
- `num_leds`: Anzahl LEDs in deinem Strip
- `type`: Farbfolge (GRB, RGB, GRBW) - teste verschiedene Werte
- `variant`: WS2812, WS2812X, WS2813, SK6812
- `color_correct`: Farbbalance anpassen [R%, G%, B%]
- `gamma_correct`: Helligkeitskurve (Standard 2.8)

## Verkabelung bei langen Strips
- **Stromeinspeisung**: Alle 50-100 LEDs zusätzlich VCC/GND anschließen
- **Level Shifter**: Bei 3.3V MCU → 5V Strip (74HCT125 oder ähnlich)
- **Kurze Datenleitungen**: Datenpin so nah wie möglich am Strip

## Sicherheit
- `color_correct` reduziert Gesamthelligkeit → weniger Strom
- Power-Monitoring zeigt geschätzten Verbrauch
- Emergency-Off Button für sofortiges Abschalten

## Beliebte LED-Typen
- **WS2812B**: Standard, 5V, GRB
- **WS2813**: Backup-Datenleitung, ausfallsicherer
- **SK6812**: RGBW-Variante mit weißer LED
- **WS2811**: Externe Controller, 12V

## Anwendungsbeispiele
- Ambient TV-Beleuchtung
- Treppenlicht
- Benachrichtigungs-LEDs
- Party-/Event-Beleuchtung
- Status-Anzeigen
