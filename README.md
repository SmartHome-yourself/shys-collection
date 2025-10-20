# SmartHomeYourself – Templates & Setups

Kompakte Sammlung für **ESPHome**, **Hardware-Boards**, **Home Assistant** und **Node-RED**. 
Fokus: **einfach**, **überschaubar**, **konsistente Ordner**. Optional gibt's einen Validator, GitHub Action und einen Pre‑commit Hook.

## Struktur (Überblick)
```
/templates
  /esphome/{snippets,setups}
  /hardware/<board-name>/{kicad,manufacturing,esphome,assets}
  /home-assistant/{integrations,dashboard,scripts}
  /nodered/flows
/skeletons
  /esphome-{snippet,setup}-template
  /hardware-template
  /home-assistant-template
  /nodered-template
/tools/{validator,hooks}
/.github/workflows/validate.yml
```


## 🚀 Zur Collection beitragen

Es gibt **zwei Wege**, eigene Projekte beizutragen:

### Methode 1: ZIP-Upload via Issue (Einfach für Einsteiger)

**Perfekt für Nutzer ohne Git-Kenntnisse!**

1. **[Neues Issue erstellen](../../issues/new/choose)** und Template wählen
2. ZIP-Datei mit deinem Projekt hochladen
3. Automatische Validierung prüft dein Projekt
4. Bei Erfolg: Automatischer Pull Request wird erstellt! ✅
5. Bei Fehlern: Detaillierte Rückmeldung im Issue mit Korrekturhinweisen

**Verfügbare Templates:**
- ESPHome Snippet (Sensoren, Aktoren, etc.)
- ESPHome Setup (Komplette Projekte)
- Hardware (PCB-Designs)
- Home Assistant (Integrationen, Dashboards, Blueprints)
- Node-RED Flows

### Methode 2: Direkter Beitrag via Git (Für Entwickler)

**Für erfahrene Git-Nutzer:**

1. Passende Vorlage aus `/skeletons/` kopieren
2. In den richtigen `/templates/` Unterordner einfügen
3. Ordner umbenennen und Platzhalter ausfüllen
4. Pre-Commit Hook installieren (siehe unten)
5. Committen und Pull Request erstellen

**Beispiel:**
```bash
cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/mein-sensor/
cd templates/esphome/snippets/sensors/mein-sensor/
# slug.yaml → mein-sensor.yaml umbenennen
# README.md anpassen
```

➡️ **Alle Vorlagen und Regeln**: siehe `CONTRIBUTING.md`


## Git-Tools & Validator (Windows & Linux)

Der Validator prüft nur Struktur & Dateinamen (kein YAML-Parsing). JSON-Flows werden auf gültiges JSON geprüft.

### Voraussetzungen

- **Python 3.x**
  - Windows: https://www.python.org/downloads/ (Haken „Add Python to PATH" setzen)
  - Linux/macOS: Paketmanager

- **Optional**: Git Bash (Windows) oder PowerShell

### Quickstart

```bash
git clone <REPO_URL>
cd <REPO_ORDNER>
pip install -r tools/validator/requirements.txt
python tools/validator/validate.py
```

### 🛡️ Pre-commit Hook (nur für Team-Mitglieder)

**Wichtig:** Der Pre-Commit Hook ist nur für **direkte Team-Mitglieder** relevant, die in Branches arbeiten.
**Externe Contributors** nutzen ZIP-Upload via Issues oder Forks - die Validierung läuft automatisch auf GitHub!

**Installation (Team-Mitglieder):**

**Windows (PowerShell):**
```powershell
.\tools\hooks\install.ps1
```

**Linux/Mac (Bash):**
```bash
./tools/hooks/install.sh
```

**Was macht der Hook?**
- Blockiert fehlerhafte Commits **vor** dem Push
- Führt Validator automatisch bei jedem Commit aus
- Spart Zeit, da Fehler sofort lokal erkannt werden

**Hinweis:** Auch ohne Hook sind alle Beiträge geschützt - GitHub Actions validiert automatisch bei jedem Pull Request!
