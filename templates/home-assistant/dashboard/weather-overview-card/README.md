# Wetter-Übersicht Dashboard Card

## Zweck
Umfassende Wetter-Dashboard Card, die aktuelle Wetterdaten, Vorhersagen und Warnungen übersichtlich anzeigt.

## Features
- **Aktuelles Wetter**: Temperatur, Zustand, Icon
- **Innen/Außen Vergleich**: Temperaturanzeige für drinnen und draußen
- **Detaillierte Daten**: Luftfeuchtigkeit, Luftdruck, Wind, UV-Index
- **Niederschlag**: Regen heute, Regenrate, Regenwahrscheinlichkeit
- **5-Tage Vorhersage**: Wettertrend für die nächsten Tage
- **Wetterwarnungen**: DWD-Warnungen bei Bedarf
- **Regenradar**: Eingebettete Niederschlagskarte

## Benötigte Entitäten

### Wetter-Integration
```yaml
# OpenWeatherMap Integration (empfohlen)
weather:
  - platform: openweathermap
    api_key: !secret openweather_api
    latitude: !secret latitude
    longitude: !secret longitude
```

### Sensoren
Die Card erwartet folgende Sensoren:
- `sensor.outdoor_temperature` - Außentemperatur
- `sensor.indoor_temperature` - Innentemperatur  
- `sensor.outdoor_humidity` - Luftfeuchtigkeit
- `sensor.pressure` - Luftdruck
- `sensor.wind_speed` - Windgeschwindigkeit
- `sensor.uv_index` - UV-Index
- `sensor.rain_today` - Regen heute
- `sensor.rain_rate` - Aktuelle Regenrate

### Optional: DWD Wetterwarnungen
```yaml
sensor:
  - platform: dwd_weather_warnings
    region_name: "Deine Region"
    
binary_sensor:
  - platform: template
    sensors:
      weather_warning_active:
        friendly_name: "Wetterwarnung aktiv"
        value_template: >
          {{ state_attr('sensor.dwd_weather_warnings', 'warning_count') | int > 0 }}
```

## Anpassung

### Entitäten ändern
Passe die Entity-IDs in der YAML an deine Sensoren an:
```yaml
entity: sensor.dein_sensor_name
```

### Farben und Styling
Das Design nutzt CSS-Variablen von Home Assistant:
- `--primary-color`: Haupt-Akzentfarbe
- `--accent-color`: Sekundär-Akzentfarbe
- `--card-background-color`: Karten-Hintergrund

### Regenradar anpassen
Ersetze die URL durch deinen bevorzugten Anbieter:
```yaml
url: "https://www.wetteronline.de/regenradar"
```

## Abhängigkeiten

### HACS Komponenten (empfohlen)
- **card-mod**: Für erweiterte Styling-Optionen
- **DWD Weather Warnings**: Für deutsche Wetterwarnungen

### Installation card-mod
```yaml
# Über HACS oder manuell
# Frontend → Benutzerdefinierte Repositories
# https://github.com/thomasloven/lovelace-card-mod
```

## Responsive Design
Die Card passt sich automatisch an verschiedene Bildschirmgrößen an:
- **Desktop**: Nebeneinander angeordnet
- **Tablet**: Gestapelt mit optimaler Breite
- **Mobile**: Vollbreite, vertikale Anordnung

## Erweiterte Features

### Animationen hinzufügen
```yaml
card_mod:
  style: |
    ha-card {
      transition: all 0.3s ease;
    }
    ha-card:hover {
      transform: scale(1.02);
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }
```

### Bedingte Anzeige
```yaml
# Nur bei bestimmten Wetterbedingungen anzeigen
type: conditional
conditions:
  - entity: weather.openweathermap
    state_not: "sunny"
card:
  # Deine Card-Konfiguration
```

### Mehrere Standorte
```yaml
# Horizontal-Stack für verschiedene Standorte
type: horizontal-stack
cards:
  - !include weather-home.yaml
  - !include weather-work.yaml
```

## Troubleshooting

### Sensoren nicht verfügbar
- **OpenWeatherMap**: API-Key prüfen, Standort konfigurieren
- **Lokale Sensoren**: ESPHome/Zigbee-Geräte prüfen
- **DWD**: Internet-Verbindung und Region prüfen

### Styling funktioniert nicht
- **card-mod installiert**: Über HACS prüfen
- **Browser-Cache**: Strg+F5 für Hard-Refresh
- **YAML-Syntax**: Einrückung prüfen

### Performance-Optimierung
- **Update-Intervalle**: Wetter nur alle 10-15 Minuten aktualisieren
- **Iframe reduzieren**: Regenradar nur bei Bedarf laden
- **Sensoren-Filter**: Unnötige Sensoren deaktivieren
