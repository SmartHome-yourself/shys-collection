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


## Neue Projekte hinzufügen

**Einfachste Methode:**
1. Passende Vorlage aus `/skeletons/` kopieren
2. In den richtigen `/templates/` Unterordner einfügen
3. Ordner umbenennen und Platzhalter ausfüllen

**Beispiel:**
```bash
cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/mein-sensor/
cd templates/esphome/snippets/sensors/mein-sensor/
# slug.yaml → mein-sensor.yaml umbenennen
# README.md anpassen

# Für Setups (YAML direkt im Projekt-Root):
cp -r skeletons/esphome-setup-template/ templates/esphome/setups/mein-setup/
cd templates/esphome/setups/mein-setup/
# slug.yaml → mein-setup.yaml umbenennen
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

### Pre-commit (optional, lokal)

**Git Bash:**
```bash
bash tools/hooks/install.sh
```

**PowerShell:**
```powershell
Copy-Item tools/hooks/pre-commit .git/hooks/pre-commit
```
