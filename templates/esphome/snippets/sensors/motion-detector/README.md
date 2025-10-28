# PIR Bewegungsmelder

## Zweck
Erkennung von Bewegungen durch Infrarot-Sensor für automatische Beleuchtung, Sicherheit oder Anwesenheitserkennung.

## Anschluss
```
PIR Sensor   ESP32      Beschreibung
VCC      ->  5V/3.3V    Stromversorgung
GND      ->  GND        Masse  
OUT      ->  GPIO4      Digitales Signal
```

## Typische PIR-Module
- **HC-SR501**: Standard PIR mit Potis für Empfindlichkeit/Zeit
- **AM312**: Mini PIR (3.3V, geringer Stromverbrauch)
- **HC-SR505**: Mini PIR (5V/3.3V kompatibel)

## PIR-Einstellungen (HC-SR501)
- **Sensitivity**: Empfindlichkeit (3-7m Reichweite)
- **Time Delay**: Nachschaltzeit (5s-5min)
- **Trigger Mode**: 
  - Single (L): Ein Trigger pro Bewegung
  - Repeat (H): Kontinuierliche Trigger bei Bewegung

## Optimale Positionierung
- **Höhe**: 2-2.5m über Boden
- **Ausrichtung**: Leicht nach unten geneigt
- **Abdeckung**: Vermeidung von direktem Sonnenlicht
- **Reichweite**: 3-7m je nach Modell und Einstellung

## Erweiterte Funktionen
```yaml
binary_sensor:
  - platform: gpio
    pin: 
      number: GPIO4
      mode: INPUT_PULLDOWN
    name: "${friendly_name} Motion"
    id: motion_sensor
    device_class: motion
    filters:
      - delayed_on: 50ms   # Entprellen
      - delayed_off: 5s    # Mindest-Aus-Zeit
    on_press:
      then:
        - logger.log: "Bewegung erkannt!"
        - light.turn_on: motion_light
    on_release:
      then:
        - logger.log: "Keine Bewegung mehr"
        - delay: 60s  # 1 Minute warten
        - light.turn_off: motion_light

# Optional: Zähler für Bewegungen
sensor:
  - platform: template
    name: "${friendly_name} Motion Count"
    id: motion_count
    accuracy_decimals: 0
    lambda: |-
      static int count = 0;
      if (id(motion_sensor).state) {
        count++;
      }
      return count;
    update_interval: 1s

# Optional: Letzte Bewegung Zeitstempel  
text_sensor:
  - platform: template
    name: "${friendly_name} Last Motion"
    id: last_motion
    lambda: |-
      if (id(motion_sensor).state) {
        char time_str[20];
        time_t now = time(nullptr);
        strftime(time_str, sizeof(time_str), "%H:%M:%S", localtime(&now));
        return std::string(time_str);
      }
      return {};
```

## Anwendungsbeispiele

### Automatisches Licht
- Licht ein bei Bewegung
- Ausschaltverzögerung nach letzter Bewegung
- Tageslicht-Sensor kombinieren

### Sicherheitssystem
- Push-Benachrichtigung bei Bewegung
- Kamera-Aufzeichnung auslösen
- Alarm-System aktivieren

### Anwesenheitserkennung
- Smart Home Modi umschalten
- Heizung/Klimaanlage steuern
- Energiesparmodus deaktivieren

## Tipps zur Störungsreduzierung
- **Warmup-Zeit**: PIR braucht 10-60s zum Stabilisieren
- **Haustiere**: Empfindlichkeit reduzieren oder Höhe anpassen
- **Wärmequellen**: Abstand zu Heizungen/direktem Sonnenlicht
- **Luftbewegung**: Vor Ventilatoren/Klimaanlagen schützen

## Stromverbrauch
- **HC-SR501**: ~65mA aktiv
- **AM312**: ~15µA standby, ~100µA aktiv
- **Deep Sleep**: PIR als Wake-up Quelle nutzen

## Troubleshooting
- **Ständig aktiv**: Empfindlichkeit zu hoch, Wärmequellen
- **Keine Erkennung**: Verkabelung, Stromversorgung prüfen
- **Falscher Alarm**: Trigger-Mode auf Single stellen
- **Verzögerung**: PIR-Potis oder ESPHome-Filter anpassen
