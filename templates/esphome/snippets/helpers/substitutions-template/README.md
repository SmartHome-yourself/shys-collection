# Substitutions Template

## Zweck
Wiederverwendbare ESPHome-Konfiguration mit Variablen für einfache Anpassung und Wartung.

## Vorteile
- **Wiederverwendbarkeit**: Ein Template für mehrere ähnliche Geräte
- **Einfache Anpassung**: Nur Substitutions ändern statt ganzen Code
- **Weniger Fehler**: Zentrale Definition wichtiger Werte
- **Bessere Wartung**: Änderungen an einer Stelle wirken überall

## Nutzung
1. **Template kopieren**: Als Basis für neue Geräte verwenden
2. **Substitutions anpassen**: Device-Name, Pins, Timing ändern
3. **Komponenten hinzufügen**: Sensoren, Aktoren unter dem Template

## Wichtige Substitutions

### Device-Identifikation
```yaml
device_name: "küche-sensor"      # Eindeutiger Name (nur Kleinbuchstaben)
friendly_name: "Küche Sensor"   # Anzeigename in Home Assistant
device_description: "Temperatur und Luftfeuchtigkeit in der Küche"
```

### Hardware-Pins
```yaml
pin_sda: "GPIO21"    # I²C Datenleitung
pin_scl: "GPIO22"    # I²C Taktleitung  
pin_led: "GPIO2"     # Status-LED
pin_button: "GPIO0"  # Eingabetaste
```

### Timing-Einstellungen
```yaml
update_interval_fast: "5s"     # Kritische Sensoren
update_interval_normal: "30s"  # Standard-Sensoren
update_interval_slow: "60s"    # Status-Informationen
```

## Erweiterte Nutzung

### Bedingte Kompilierung
```yaml
# In substitutions:
feature_display: "true"

# Im Code:
display:
  - if:
      condition:
        - lambda: 'return ${feature_display};'
      then:
        # Display-Konfiguration hier
```

### Board-spezifische Pins
```yaml
# ESP32
pin_sda: "GPIO21"
pin_scl: "GPIO22"

# ESP8266/D1 Mini
pin_sda: "GPIO4"   # D2
pin_scl: "GPIO5"   # D1
```

## Secrets Integration
Erstelle `secrets.yaml`:
```yaml
wifi_ssid: "Dein-WiFi"
wifi_password: "dein-passwort"
api_encryption_key: "generierter-32-zeichen-schlüssel"
ota_password: "ota-passwort"
```

## Beispiel für Device-spezifische Anpassung
```yaml
# Basis-Template einbinden
<<: !include substitutions-template.yaml

# Device-spezifische Overrides
substitutions:
  device_name: "badezimmer-sensor"
  friendly_name: "Badezimmer Sensor"
  pin_dht: "GPIO4"
  
# Zusätzliche Sensoren
sensor:
  - platform: dht
    pin: ${pin_dht}
    # ... weitere DHT-Konfiguration
```

## Best Practices
- **Eindeutige Namen**: Geräte-Namen müssen unique sein
- **Logische Gruppierung**: Ähnliche Werte zusammenfassen
- **Dokumentation**: Kommentare für komplexe Substitutions
- **Versionierung**: Framework-Version explizit setzen
- **Pins dokumentieren**: Welcher Pin für welche Funktion
