# Skeletons - Kopierbare Vorlagen

Diese Ordner sind **Kopier-Vorlagen** für neue Projekte. Kopiere den passenden Ordner und benenne ihn entsprechend um.

## Verfügbare Vorlagen

### ESPHome
- **`esphome-snippet-template/`** → Für neue Snippets (Sensoren, Aktoren, etc.)
- **`esphome-setup-template/`** → Für komplette Setups

### Hardware
- **`hardware-template/`** → Für neue PCB-Boards (KiCad, Manufacturing, ESPHome)

### Home Assistant
- **`home-assistant-template/`** → Für Integrations, Dashboard-Snippets, Blueprints

### Node-RED
- **`nodered-template/`** → Für neue Flows

## Verwendung

1. **Ordner kopieren**: `cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/mein-neuer-sensor/`
2. **Dateien anpassen**: Alle `<platzhalter>` durch echte Werte ersetzen
3. **Ordner umbenennen**: `slug.yaml` in `mein-neuer-sensor.yaml` umbenennen
4. **Inhalte ausfüllen**: README.md und YAML/JSON mit echten Daten füllen

## Hinweise

- Alle Vorlagen folgen der korrekten Ordnerstruktur
- README.md enthält Platzhalter für Titel und Beschreibungen
- YAML/JSON-Dateien haben die richtige Grundstruktur
- Optional-Ordner (assets/, variants/) sind bereits angelegt
