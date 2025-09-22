# Batterie-Sensor

## Zweck
Überwachung der Batteriespannung und Berechnung des Ladezustands für batteriebetriebene ESPHome-Geräte.

## Anschluss
**Spannungsteiler für Batterieüberwachung:**
```
Batterie+ ---- [10kΩ] ---- [Analog Pin] ---- [10kΩ] ---- GND
```

## Schaltung
```
LiPo/Li-Ion    ESP32
Bat+  -> [10kΩ] -> GPIO36 (A0)
         [10kΩ] -> GND
Bat-  -> GND
```

## Nutzung
- **Spannungsteiler**: 2x 10kΩ Widerstände (Verhältnis 1:1)
- **Korrektur**: `multiply: 2.0` für 50% Spannungsteiler
- **LiPo-Kurve**: Optimiert für 3.7V LiPo/Li-Ion Akkus
- **Attenuation**: 11dB für ESP32 bei höheren Spannungen

## Batterie-Typen

### LiPo/Li-Ion (3.7V nominal)
- **Voll geladen**: 4.2V (100%)
- **Nominal**: 3.7V (50%)
- **Entladen**: 3.0V (0%)
- **Schutzabschaltung**: 2.5V

### NiMH/NiCd (1.2V pro Zelle)
- **3x Zellen**: 3.6V nominal
- **4x Zellen**: 4.8V nominal
- Andere Entladekurve erforderlich

## Anpassung für andere Batterien
Entladekurve im Lambda-Code anpassen:
```cpp
// Beispiel für 3x NiMH (3.6V nominal)
if (voltage >= 4.0) {
  percentage = 100.0;
} else if (voltage >= 3.6) {
  percentage = 50.0 + (voltage - 3.6) / 0.4 * 50.0;
} // ... weitere Stufen
```

## Kalibrierung
1. **Multimeter**: Tatsächliche Batteriespannung messen
2. **Multiply-Faktor**: Anpassen bis Werte stimmen
3. **Widerstandswerte**: Bei anderen Verhältnissen anpassen

## Hinweise
- **Spannungsteiler notwendig**: Batterien oft >3.3V
- **Low-Power**: Update-Intervall erhöhen für längere Laufzeit
- **Tiefentladungsschutz**: Warnung bei niedrigen Werten
- **Temperatureinfluss**: Kapazität ändert sich mit Temperatur

## Anwendungsbeispiele
- Solarstationen
- Portable Sensoren
- IoT-Geräte mit Akku
- Notfall-Überwachung
