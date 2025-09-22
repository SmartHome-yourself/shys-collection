# Sensor-Snippets

**Wichtig:** In der Kategorie-Wurzel sind nur `README.md` + Unterordner `<slug>/` erlaubt.

## Ordnerstruktur

```
<slug>/
  <slug>.yaml
  README.md
  assets/      (optional)
  variants/    (optional)
```

## README-Vorlage

```markdown
# <Titel des Snippets>
1–2 Sätze, wofür es ist.

## Getestet mit
- ESPHome <Version> (falls bekannt)

## Hinweise
- z. B. Pins, I²C-Adresse, Pullups, substitutions
```

## YAML-Skeleton

```yaml
# <Kurzname> – Zweck/Hardware (ESP32/ESP8266)
# Nutzung: drop-in; anpassbar via substitutions
# Getestet mit: <Board/Setup>, ESPHome <Version>

substitutions:
  devicename: <slug>

esphome:
  name: ${devicename}

logger:
api:
ota:
```

## Typische Stolpersteine

- **I²C‑Adressen** (0x76/0x77 etc.) und **Pullups** (3V3, 4.7–10k) prüfen.
- **OneWire**: stabilen Pullup (4.7k) einplanen.
- **Kalibrierung**: Strom/Spannungssensoren (HLW8012, PZEM) brauchen Kalibrierwerte.

**Beispiel-Einbindung (I²C allgemein)**
```yaml
i2c:
  sda: 21
  scl: 22
  scan: true
```
