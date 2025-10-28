# PWM LED Dimmer

## Zweck
Stufenlose Helligkeitssteuerung für einfarbige LEDs, LED-Streifen oder andere PWM-gesteuerte Lasten.

## Anschluss
**Direkte LED-Ansteuerung:**
```
ESP32     LED
GPIO5 -> [220Ω] -> LED+ -> LED- -> GND
```

**MOSFET für höhere Lasten:**
```
ESP32     MOSFET      LED Strip
GPIO5 -> Gate       Source -> GND
         Drain  -> LED Strip -
         
12V   -> LED Strip +
```

## MOSFETs für verschiedene Lasten
- **IRF540N**: bis 33A @ 100V (überdimensioniert, aber robust)
- **IRLZ44N**: bis 47A @ 55V (Logic Level, 3.3V-kompatibel)
- **2N7000**: bis 200mA @ 60V (kleine LEDs)

## Wichtige Parameter
- `frequency`: PWM-Frequenz (1kHz+ für flimmerfreies Licht)
- `gamma_correct`: Natürliche Helligkeitskurve (2.8 Standard)
- `transition_length`: Sanfte Übergänge
- `channel`: ESP32 hat 16 LEDC-Kanäle (0-15)

## Helligkeitssteuerung
- **Prozentual**: 0-100% über Home Assistant
- **Number Slider**: Manuelle Eingabe
- **Preset Buttons**: Vordefinierte Helligkeitsstufen
- **Effekte**: Pulse, Strobe, Breathing

## Anwendungen
- **Arbeitsplatzbeleuchtung**: Dimmbare Schreibtischlampe
- **Nachtlicht**: Sanftes Ein-/Ausblenden
- **Mood Lighting**: Ambiente-Beleuchtung
- **Grow Light**: Pflanzenbeleuchtung mit Timer
- **Status LEDs**: Helligkeit je nach Zustand

## Tipps
- Bei hohen Strömen: Kühlkörper für MOSFET verwenden
- PWM-Frequenz >1kHz für flimmerfreies Licht
- Gamma-Korrektur für natürliche Helligkeitsverteilung
- Bei 12V-Strips: Logic-Level MOSFET oder Level-Shifter

## Erweiterte Varianten
- **RGB-Dimmer**: 3x PWM für RGB-Strips
- **RGBW-Dimmer**: 4x PWM für RGBW-Strips  
- **Sync-Dimmer**: Mehrere Ausgänge synchron
- **Sunrise-Alarm**: Langsames Aufhellen als Wecker
