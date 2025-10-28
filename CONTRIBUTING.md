# CONTRIBUTING

Willkommen bei shys-collection! Es gibt zwei Wege, zur Collection beizutragen:

## 🚀 Methode 1: ZIP-Upload via Issue (für Einsteiger)

**Einfach für Nutzer ohne Git-Kenntnisse:**

1. Gehe zu [Issues](../../issues/new/choose)
2. Wähle das passende Template (ESPHome Snippet, Hardware, etc.)
3. Lade dein Projekt als ZIP-Datei hoch
4. Die automatische Validierung prüft dein Projekt
5. Bei Erfolg wird automatisch ein Pull Request erstellt
6. Bei Fehlern erhältst du eine detaillierte Rückmeldung im Issue

**Wichtig:** Nutze die Vorlagen aus `/skeletons/` zur Erstellung deines Projekts!

## 💻 Methode 2: Direkter Beitrag via Git (für Entwickler)

**Für erfahrene Git-Nutzer:**

⚠️ **Wichtig für externe Contributors:**
- Erstelle einen **Fork** des Repositories
- Arbeite in einem eigenen **Branch** (nicht direkt auf main)
- Erstelle einen **Pull Request** zurück zum Haupt-Repository
- Direkte Commits auf main sind **nicht erlaubt** (Branch Protection)

### Schnellstart für neue Projekte

**Kopiere passende Vorlage aus `/skeletons/`**

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

## 🛡️ Pre-Commit Hook Installation (PFLICHT für Entwickler!)

Der Pre-Commit Hook verhindert, dass fehlerhafte Commits überhaupt erstellt werden können!

**Installation:**

**Windows (PowerShell):**
```powershell
.\tools\hooks\install.ps1
```

**Linux/Mac (Bash):**
```bash
./tools/hooks/install.sh
```

**Was macht der Hook?**
- Führt `tools/validator/validate.py` vor jedem Commit aus
- Bei Fehlern: Commit wird **BLOCKIERT**
- Bei Erfolg: Commit wird durchgeführt

**Wichtig:** Ohne installierten Hook können fehlerhafte Commits erstellt werden, die später in PRs abgelehnt werden!

## Validator & CI

**Lokal ausführen (ohne Commit):**
```bash
python tools/validator/validate.py
```

**GitHub Actions** prüft automatisch:
- ✅ Bei jedem Pull Request → Status Check "validate"
- ✅ Bei Issue ZIP-Uploads → Validierung VOR Commit
- ✅ Bei Push zu main → Zusätzliche Absicherung

**Wichtig:** Kein YAML-Parsing (Secrets & Codefences werden nicht geprüft)

## 🔒 Branch Protection

**Wichtig für alle Contributors:**
- Direkte Commits auf `main` sind **nicht erlaubt**
- Alle Änderungen müssen über **Pull Requests** erfolgen
- Pull Requests benötigen:
  - ✅ Erfolgreiche Validierung (Status Check)
  - ✅ Manuelle Review durch Maintainer

**Workflow:**
1. Fork oder Branch erstellen
2. Änderungen committen (Pre-Commit Hook validiert)
3. Pull Request erstellen
4. GitHub Actions validiert nochmal
5. Nach Review: Merge in main
