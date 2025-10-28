# Skeletons – Kopierbare Vorlagen

Diese Ordner sind **Kopier-Vorlagen** für neue Projekte.  
Kopiere den passenden Ordner und benenne ihn entsprechend um.  
Jede Vorlage enthält die korrekte Grundstruktur und alle Pflichtdateien, um neue Beiträge für die SmartHome yourself Code-Collection zu erstellen.

---

## 📦 Verfügbare Vorlagen

### ESPHome
- **esphome-snippet-template/** → Für kleine Codebeispiele (z. B. einzelne Sensoren, Aktoren oder Funktionen)
- **esphome-setup-template/** → Für vollständige ESPHome-Projekte (komplettes Gerät mit Konfiguration)

### Hardware
- **hardware-template/** → Für neue PCB- oder Hardware-Projekte mit KiCad-Dateien, Fertigungsdaten und optionaler Firmware

### Home Assistant
- **home-assistant-template/** → Für YAML-Beispiele aus configuration.yaml, Dashboards oder Blueprints

### Node-RED
- **nodered-template/** → Für neue Flows oder Automationen

---

## ⚙️ Verwendung

1. **Ordner kopieren**  
   Beispiel:  
   `cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/mein-neuer-sensor/`

2. **Dateien anpassen**  
   Ersetze alle `<platzhalter>` in Dateinamen und Inhalten durch echte Werte (z. B. Projektname, Beschreibung, Hardware).

3. **Ordner umbenennen**  
   Passe den Zielpfad und Dateinamen an (`slug.yaml` → `mein-neuer-sensor.yaml`).

4. **Inhalte ausfüllen**  
   Trage in der `README.md` Titel, Beschreibung, verwendete Hardware und Besonderheiten ein.  
   Ergänze alle YAML-/JSON-Dateien mit deinen echten Konfigurationen.

---

## 🧩 Struktur & optionale Ordner

Alle Skeletons folgen der finalen Ordnerstruktur des Repositories:

templates/  
│  
├── esphome/  
│   ├── snippets/<hardware>/<slug>/  
│   └── setups/<hardware>/<slug>/  
│  
├── home-assistant/  
│   ├── integrations/<hardware>/<slug>/  
│   └── dashboard/<hardware>/<slug>/  
│  
├── hardware/  
│   └── <board-name>/  
│       ├── kicad/            → KiCad-Projektdateien  
│       ├── manufacturing/    → Fertigungsdaten (Gerber, BoM, STL, STEP, 3MF)  
│       ├── esphome/          → Firmware oder YAML für das Board  
│       └── assets/           → Fotos, Renderings, Schaltpläne, Dokumentation  
│  
└── nodered/  
    └── flows/<slug>/         → Node-RED-Flow-Dateien  

**Optionale Ordner:**  
- `assets/` → Dokumentation, Fotos, Renderings  
- `variants/` → alternative Konfigurationen oder Abwandlungen  
- `manufacturing/` → nur bei Hardware-Projekten, wenn Fertigungsdaten vorhanden sind  
- `esphome/` (innerhalb Hardware) → nur, wenn Firmware existiert

---

## 🧱 Richtlinien

- Nur **erlaubte Dateiendungen** verwenden: `.yaml`, `.yml`, `.json`, `.md`, `.png`, `.jpg`, `.jpeg`, `.gif`  
- Alle Ordner- und Dateinamen in **kebab-case** (nur Kleinbuchstaben und Bindestriche)  
- Keine Leerzeichen, Unterstriche oder Großbuchstaben  
- Keine sensiblen Daten oder Secrets  
- `README.md` immer mit kurzer Projektbeschreibung und Hardware-Angaben ausfüllen

---

## 💡 Hinweise

- Alle Vorlagen entsprechen exakt der finalen Ordnerstruktur und bestehen die Validator-Prüfungen.  
- Die enthaltenen `README.md`-Dateien dienen als Vorlage für das finale Projekt – sie sind keine technische Dokumentation, sondern Beispielinhalte für die spätere Veröffentlichung.  
- Leere oder nicht benötigte Ordner dürfen entfernt werden, solange die Grundstruktur korrekt bleibt.


## README.md Tipps
**Gültige Markdown Syntax**
- [![image](img-url)](link-url) *→ Bild mit Link*
- ![image](img-url) *→ Bild ohne Link*
- https://freistehende-url.com *→ Link*
- [text](url) *→ Link mit Text*
- `# Überschrift` *→ Überschrift Text (Stufe 1)*
- `## Überschrift` *→ Überschrift Text (Stufe 2)*
- `### Überschrift` *→ Überschrift Text (Stufe 3)*
- `*Text*` *→ Kursiver Text*
- `**Text**` *→ Fetter Text*
- `_Text_` *→ Unterstrichener Text*
