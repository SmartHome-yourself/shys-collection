# Hardware (Boards)

**Wichtig:** hardware/-Wurzel nur `README.md` + `<board-name>/`.

Ordner je Board mit fixer Struktur:

## Ordnerstruktur

```
<board-name>/
  kicad/
  manufacturing/
    gerber/
    bom.md
  esphome/
    example.yaml
  assets/
  README.md
```

## README-Vorlage

```markdown
# <Board-Name>
Einsatzzweck/Funktion in 1–2 Sätzen.

## Dateien
- KiCad: `kicad/`
- Manufacturing: `manufacturing/` (Gerber, Bohrdaten, Fab-Notes, `bom.md`)
- ESPHome: `esphome/` (board-spezifische YAMLs)
- Assets: `assets/` (optional)
```

## example.yaml Placeholder

```yaml
# Board-spezifische Grundeinstellung
substitutions:
  devicename: board-example

esphome:
  name: ${devicename}
```

## Beachte

- **KiCad-Version** nennen (z. B. 7.x/8.x). https://www.kicad.org/
- **Gerber-Export** inkl. Bohrdaten & Positionsdateien dokumentieren.
- **Polung/Abstände** und Sicherungen (z. B. PTC) in README erwähnen.
- **ESD/Netzspannung**: Sicherheits-Hinweise, falls relevant.
