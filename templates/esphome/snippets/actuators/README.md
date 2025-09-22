# Aktor-Snippets

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

## Beachte

- **Relais-Logik**: einige Boards sind **inverted** (LOW = an).  
- **PWM**: Frequenz & Auflösung passend zur Last wählen; bei LED Flimmern beachten.  
- **Sicherheit**: Standardzustand beim Booten definieren (`restore_mode`).

**Beispiel (Relais, invertiert)**
```yaml
switch:
  - platform: gpio
    pin: 
      number: 25
      inverted: true
    name: "Relais 1"
    restore_mode: RESTORE_DEFAULT_OFF
```
