# ESPHome Setups

**Wichtig:** In setups/-Wurzel nur `README.md` + `<setup-name>/`.

Komplette, lauffähige Konfigurationen **ohne** eigene PCB (z. B. BLE‑Proxy).

## Ordnerstruktur

```
<setup-name>/
  example.yaml
  README.md
  assets/      (optional)
  variants/    (optional)
```

## README-Vorlage

```markdown
# <Name des Setups>
Zweck/Ergebnis in 1–2 Sätzen; keine eigene PCB notwendig.

## Firmware
- `example.yaml` (eigene Varianten unter `variants/`)

## Hinweise
- Secrets via `!secret` (https://esphome.io/guides/secrets.html)
```

## example.yaml Skeleton

```yaml
# Beispiel-Setup
substitutions:
  devicename: example-setup

esphome:
  name: ${devicename}

logger:
api:
ota:
```

## Beachte

- **WLAN/Secrets** immer via `!secret` lösen. https://esphome.io/guides/secrets.html
- **Board-Auswahl** passend setzen (z. B. `esp32doit-devkit-v1`).
- Logs prüfen (`esphome logs …`), besonders bei BLE/Power‑Save.
