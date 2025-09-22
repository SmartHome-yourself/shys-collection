# CONTRIBUTING

## Schnellstart für neue Projekte

**Einfachste Methode: Kopiere passende Vorlage aus `/skeletons/`**

```bash
# Beispiel: Neuer Sensor
cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/mein-sensor/
cd templates/esphome/snippets/sensors/mein-sensor/
# slug.yaml → mein-sensor.yaml umbenennen
# README.md anpassen
```

**Verfügbare Vorlagen:**
- **`skeletons/esphome-snippet-template/`** → Für Sensoren, Aktoren, etc.
- **`skeletons/esphome-setup-template/`** → Für komplette Setups
- **`skeletons/hardware-template/`** → Für PCB-Boards
- **`skeletons/home-assistant-template/`** → Für HA-Integrations
- **`skeletons/nodered-template/`** → Für neue Flows

## Regeln & Strukturen

**Kurz & verbindlich:**
- Halte dich an die Ordnerstrukturen!
- Ordnername dürfen nur aus Kleinbuchstaben, Ziffern und Bindestrich (-) bestehen.
- YAML-Dateien haben immer die Dateiendung `.yaml`.
- BOM liegt als `manufacturing/bom.csv` **oder** `manufacturing/bom.md` vor.
- `README.md` ist Pflicht in jedem **Setup-** und **Board-**Ordner!
- Snippets gehören jeweils in einen eigenen Ordner.
- Je Snippet wird die `<slug>.yaml` + `README.md` erwartet.

**Wichtig:** In Kategorie-Wurzeln sind nur `README.md` + Unterordner erlaubt (keine .yaml/.json direkt dort).

Siehe `README.md` in den jeweiligen Oberordnern für weitere Hinweise.

## Validator & CI

**Lokal ausführen:**
```bash
python tools/validator/validate.py
```

**Wichtig:** Kein YAML-Parsing (Secrets & Codefences egal)

**GitHub Action** prüft PRs/Pushes automatisch

**Windows Pre-commit:**
- Git Bash: `bash tools/hooks/install.sh`
- PowerShell: Datei nach `.git/hooks/` kopieren
