# ESPHome Snippets (Ordner je Snippet)

Jedes Snippet hat einen **eigenen Ordner**:
```
<kategorie>/<snippet-slug>/
  <snippet-slug>.yaml   # Pflicht (YAML muss existieren)
  README.md             # Pflicht (kurz: Zweck, Nutzung, Hinweise)
  assets/               # optional (Bilder/Pinouts)
  variants/             # optional (weitere YAMLs)
```
  
### Kategorien:
- sensors
- actuators
- helpers
- networks
  
### Tipps
- Snippet kurz halten und immer nur ein Thema je Snippet
- Komplexe Varianten in Unterordner `variants/` ablegen.
- Kopfkommentar (2‑3 Zeilen) mit Zweck & ESPHome‑Version hilft enorm.
- Secrets (WLAN, Tokens) gehören **nicht** ins Snippet.
- Pin-Definitionen und andere Einstellungen so weit möglich in Substitutions auslagern
  