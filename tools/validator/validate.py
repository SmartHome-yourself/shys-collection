#!/usr/bin/env python3
from pathlib import Path
import sys, json, re
import yaml

# Fix Windows console encoding for emojis
if sys.platform == 'win32':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')

# Allow optional path argument (for ZIP extraction validation)
if len(sys.argv) > 1:
    REPO = Path(sys.argv[1]).resolve()
else:
    REPO = Path(__file__).resolve().parents[2]

errors = []

def err(msg, path=None):
    p = f" [{path}]" if path else ""
    errors.append(f"ERROR: {msg}{p}")

def kebab_ok(s: str) -> bool:
    return re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", s or "") is not None

def load_yaml(p: Path):
    try:
        yaml.safe_load(p.read_text(encoding="utf-8"))
    except Exception as e:
        err(f"YAML fehlerhaft: {e}", p)

def load_json(p: Path):
    try:
        json.loads(p.read_text(encoding="utf-8"))
    except Exception as e:
        err(f"JSON fehlerhaft: {e}", p)

def check_structure():
    must = [
        "templates/esphome/snippets",
        "templates/esphome/setups",
        "templates/hardware",
        "templates/home-assistant/blueprints",
        "templates/home-assistant/integrations",
        "templates/home-assistant/dashboard",
        "templates/home-assistant/scripts",
        "templates/nodered/flows",
    ]
    for rel in must:
        if not (REPO / rel).exists():
            err("Pfad fehlt", rel)

def check_category_roots():
    """Prüft, dass in Kategorie-Wurzeln nur README.md und Unterordner erlaubt sind"""
    category_paths = [
        "templates/esphome/snippets/sensors",
        "templates/esphome/snippets/actuators",
        "templates/esphome/snippets/helpers",
        "templates/esphome/snippets/networks",
        "templates/esphome/setups",
        "templates/hardware",
        "templates/home-assistant/integrations",
        "templates/home-assistant/dashboard",
        "templates/home-assistant/blueprints",
        "templates/home-assistant/scripts",
        "templates/nodered/flows"
    ]

    for rel_path in category_paths:
        cat_dir = REPO / rel_path
        if not cat_dir.exists():
            continue

        for item in cat_dir.iterdir():
            if item.name == "README.md" or item.name.startswith("_"):
                continue  # README.md und _vorlagen sind erlaubt
            if item.is_dir():
                continue  # Unterordner sind erlaubt
            if item.is_file():
                err(f"Unerlaubte Datei in Kategorie-Wurzel: {item.name} (nur README.md und Unterordner erlaubt)", item)

def check_esphome_snippets():
    base = REPO / "templates/esphome/snippets"
    allowed_cats = {"sensors", "actuators", "helpers", "networks"}
    if not base.exists(): return
    for child in base.iterdir():
        if child.is_dir() and child.name not in allowed_cats:
            err(f"Unerlaubte Kategorie in snippets/: {child.name}", child)
    for cat in allowed_cats:
        cdir = base / cat
        if not cdir.exists(): continue
        for snip in [d for d in cdir.iterdir() if d.is_dir()]:
            slug = snip.name
            if not kebab_ok(slug):
                err("Slug ungültig: Nur Kleinbuchstaben, Ziffern und Bindestrich (-) erlaubt.", snip)
            yamls = list(snip.glob("*.yaml"))
            if not yamls:
                err("Keine YAML im Snippet-Ordner gefunden (mind. eine .yaml erforderlich)", snip)
            readme = snip / "README.md"
            if not readme.exists():
                err("README.md fehlt (Snippet)", snip)
            for child in snip.iterdir():
                if child.is_dir() and child.name not in {"assets", "variants"}:
                    err(f"Unerlaubter Unterordner in Snippet: {child.name}", child)

def check_esphome_setups():
    base = REPO / "templates/esphome/setups"
    if not base.exists(): return
    for setup in [d for d in base.iterdir() if d.is_dir()]:
        slug = setup.name
        if not kebab_ok(slug):
            err("Setup-Ordnername ungültig: Nur Kleinbuchstaben, Ziffern und Bindestrich (-) erlaubt.", setup)
        readme = setup / "README.md"
        if not readme.exists():
            err("README.md fehlt (Setups)", setup)
        # YAML-Dateien müssen direkt im Setup-Ordner liegen (Projekt-Root)
        yamls = list(setup.glob("*.yaml"))
        if not yamls:
            err("Keine YAML im Setup-Ordner gefunden (mind. eine .yaml erforderlich)", setup)
        for child in setup.iterdir():
            if child.is_dir() and child.name not in {"assets", "variants", "components"}:
                err(f"Unerlaubter Ordner in setups/{setup.name}: {child.name}", child)

def check_hardware():
    base = REPO / "templates/hardware"
    if not base.exists(): return
    for board in [d for d in base.iterdir() if d.is_dir()]:
        slug = board.name
        if not kebab_ok(slug):
            err(f"Ordnername {slug} ungültig in {board}: Nur Kleinbuchstaben, Ziffern und Bindestrich (-) erlaubt.")
        names = {c.name for c in board.iterdir()}
        if "kicad" not in names: err(f"kicad/ fehlt in {board}")
        if "manufacturing" not in names: err(f"manufacturing/ fehlt in {board}")
        if "esphome" not in names: err(f"esphome/ fehlt in {board}")
        if "README.md" not in names: err(f"README.md fehlt in {board}")
        for child in board.iterdir():
            if child.is_dir() and child.name not in {"kicad","manufacturing","esphome","assets"}:
                err(f"Unerlaubter Ordner in {board.name}: {child.name}")
        
        # Check esphome/ subdirectory for allowed folders
        esphome_dir = board / "esphome"
        if esphome_dir.exists() and esphome_dir.is_dir():
            for child in esphome_dir.iterdir():
                if child.is_dir() and child.name not in {"variants", "components"}:
                    err(f"Unerlaubter Ordner in {board.name}/esphome: {child.name}", child)
        
        mf = board / "manufacturing"
        if mf.exists():
            has_bom = any((mf / f).exists() for f in ["bom.csv"]) or list(mf.glob("bom.*"))
            if not has_bom:
                err(f"BOM (bom.csv) fehlt in {mf}/manufacturing")

def check_ha():
    for rel in ["templates/home-assistant/integrations", "templates/home-assistant/dashboard", "templates/home-assistant/blueprints"]:
        base = REPO / rel
        if not base.exists(): continue
        for haProject in [d for d in base.iterdir() if d.is_dir()]:
            # Relativen Pfad direkt konstruieren statt relative_to()
            rel_path = f"{rel}/{haProject.name}"

            readme = haProject / "README.md"
            if not readme.exists():
                err(f"README.md fehlt in {rel_path}")

            for child in haProject.iterdir():
                if child.is_dir() and child.name not in {"assets", "variants"}:
                    err(f"Unerlaubter Ordner in {rel_path}: {child.name}")

            yamls = list(haProject.rglob('*.yaml'))
            if not yamls:
                err(f"Keine YAML in {rel_path}")

def check_ha_scripts():
    """Prüft Home Assistant Scripts - ähnlich wie ESPHome setups"""
    base = REPO / "templates/home-assistant/scripts"
    if not base.exists(): return
    for script in [d for d in base.iterdir() if d.is_dir()]:
        slug = script.name
        if not kebab_ok(slug):
            err("Script-Ordnername ungültig: Nur Kleinbuchstaben, Ziffern und Bindestrich (-) erlaubt.", script)
        readme = script / "README.md"
        if not readme.exists():
            err("README.md fehlt (Scripts)", script)
        # YAML-Dateien müssen direkt im Script-Ordner liegen (Projekt-Root)
        yamls = list(script.glob("*.yaml"))
        if not yamls:
            err("Keine YAML im Script-Ordner gefunden (mind. eine .yaml erforderlich)", script)
        for child in script.iterdir():
            if child.is_dir() and child.name not in {"assets", "variants"}:
                err(f"Unerlaubter Ordner in scripts/{script.name}: {child.name}", child)



#        if haProject.exists():
#            for y in haProject.rglob('*.yaml'):
#                load_yaml(y)

def check_nodered():
    base = REPO / "templates/nodered/flows"
    if not base.exists(): return
    for j in base.rglob('*.json'):
        load_json(j)

def format_errors_for_github():
    """Format errors in a user-friendly way for GitHub issues"""
    output = []
    output.append("❌ **Dein Projekt hat folgende Validierungsfehler:**\n")
    
    for i, error in enumerate(errors, 1):
        # Clean up error message
        clean_error = error.replace("ERROR: ", "").replace(str(REPO) + "/", "")
        clean_error = clean_error.replace(str(REPO) + "\\", "")
        output.append(f"{i}. {clean_error}")
    
    output.append("\n## 🔧 Häufige Probleme und Lösungen:\n")
    output.append("- **Ordner-/Dateinamen**: Nur Kleinbuchstaben, Ziffern und Bindestrich (-) erlaubt")
    output.append("  - ❌ Falsch: `my_project`, `MyProject`, `project_123`")
    output.append("  - ✅ Richtig: `my-project`, `project-123`\n")
    output.append("- **README.md fehlt**: Jedes Projekt braucht eine README.md mit Beschreibung\n")
    output.append("- **Ordnerstruktur**: Prüfe ob alle Pflichtordner vorhanden sind")
    output.append("  - ESPHome Snippets: `templates/esphome/snippets/[kategorie]/[slug]/`")
    output.append("  - Hardware: `templates/hardware/[slug]/` mit kicad/, manufacturing/, esphome/ Ordnern\n")
    output.append("## 📤 Nächste Schritte:\n")
    output.append("1. Korrigiere die oben genannten Fehler")
    output.append("2. Packe dein Projekt erneut als ZIP")
    output.append("3. Lade die korrigierte ZIP-Datei **als Kommentar** unter diesem Issue hoch")
    output.append("4. Die Validierung läuft automatisch erneut! 🔄")
    
    return "\n".join(output)

def main():
    check_structure()
    check_category_roots()  # Neue Prüfung hinzugefügt
    check_esphome_snippets()
    check_esphome_setups()
    check_hardware()
    check_ha()
    check_ha_scripts()  # Neue Prüfung für Home Assistant Scripts
    check_nodered()

    if errors:
        log_file = REPO / "validation_errors.log"
        with open(log_file, "w", encoding="utf-8") as f:
            f.write('\n'.join(errors))
        
        # Check if we should output GitHub-friendly format
        github_format = "--github" in sys.argv
        
        if github_format:
            print(format_errors_for_github())
        else:
            print(f" Validation failed - Log in REPO/validation_errors.log - ")
            print("\n=== Validation Errors ===")
            for error in errors:
                print(error)
            print("=" * 30)
        
        sys.exit(1)

    print('✅ Validator: OK - Alle Prüfungen bestanden!')

if __name__ == "__main__":
    main()
