# LDR Lichtsensor

## Zweck
Einfacher und günstiger Lichtsensor für Tag/Nacht-Erkennung, automatische Beleuchtungssteuerung oder Helligkeitsmessung.

## Schaltung
**Spannungsteiler mit LDR:**
```
3.3V ---- [10kΩ Widerstand] ---- [Analog Pin] ---- [LDR] ---- GND
```

## Anschluss
```
Bauteil          ESP32
3.3V        ->   3.3V
10kΩ + LDR  ->   GPIO36 (A0)
GND         ->   GND
```

## Nutzung
- **Widerstandswert**: 10kΩ Festwiderstand für Standard-LDR
- **Analog Pin**: ESP32 hat mehrere ADC-Pins (GPIO36, GPIO39, GPIO34, etc.)
- **Kalibrierung**: Schwellenwerte im Code anpassen je nach Umgebung

## Hinweise
- LDR-Werte sind **nicht linear** und variieren stark zwischen verschiedenen LDRs
- **Kalibrierung erforderlich**: Schwellenwerte für Tag/Nacht an Umgebung anpassen
- **Langsame Reaktion**: LDRs reagieren träge auf Lichtänderungen
- Alternative: **BH1750** oder **TSL2561** für präzise Lux-Messung

## Kalibrierung
1. Verschiedene Lichtverhältnisse messen
2. Schwellenwerte in Binary Sensor anpassen
3. Bei Bedarf Spannungsteiler-Widerstand ändern (1kΩ - 100kΩ)

## Anwendungsbeispiele
- Automatische Außenbeleuchtung
- Jalousien-Steuerung
- Energiespar-Modus bei Dunkelheit
- Einfache Wetterstation
