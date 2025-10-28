# Scripts

**Wichtig:** Wurzel nur `README.md` + `<slug>/`.

**Nutzung**  
- In `configuration.yaml` unter `script:` einfügen **oder** per `packages/` einbinden.  
- HA neu starten oder Scripts neu laden über Developer Tools → YAML.

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
# <Script-Name>
Kurz: was macht dieses Script?

## Nutzung
- Script in Home Assistant einfügen
- Entitäten/IDs anpassen
- Per Service `script.<slug>` aufrufen

## Parameter
- `param1`: Beschreibung
- `param2`: Beschreibung

## Beispiel
```yaml
service: script.mein_script
data:
  param1: "Wert"
```

## <slug>.yaml Placeholder

```yaml
# Script-Definition
<slug>:
  alias: "Mein Script"
  description: "Was macht das Script"
  fields:
    param1:
      description: "Parameter Beschreibung"
      example: "beispielwert"
  sequence:
    - service: # deine Aktionen
```

Scripts Docs: https://www.home-assistant.io/docs/scripts/
