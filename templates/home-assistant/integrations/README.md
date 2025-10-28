# Integrations (YAML-Beispiele)

**Wichtig:** Wurzel nur `README.md` + `<slug>/`.

**Nutzung**  
- In `configuration.yaml` einfügen **oder** per `packages/` einbinden.  
- HA neu starten oder Konfiguration neu laden (falls unterstützt).

## Ordnerstruktur

```
<slug>/
  example.yaml
  README.md
  assets/      (optional)
```

## README-Vorlage

```markdown
# <HA-Projektname>
Kurz: was macht dieses Snippet/Blueprint?

## Nutzung
- In Home Assistant einfügen (Rohkonfig-Editor / Blueprints import)
- Entitäten/IDs anpassen
```

## example.yaml Placeholder

```yaml
# Beispiel-Snippet (Platzhalter)
```

YAML-Grundlagen: https://www.home-assistant.io/docs/configuration/yaml/
