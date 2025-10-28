# Network-Snippets

**Wichtig:** In der Kategorie-Wurzel sind nur `README.md` + Unterordner `<slug>/` erlaubt.

API/MQTT/BLE/WiFi-Fallback.

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

**Empfehlung**: Zuerst **API** nutzen (Discovery + Logs + Reboots). MQTT nur, wenn du es wirklich brauchst.

**Beispiel (API + OTA + Logger)**
```yaml
api:
logger:

ota:
  - platform: esphome
    password: !secret ota_pw
```
