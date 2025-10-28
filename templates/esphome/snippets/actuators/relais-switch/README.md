# Relais-Schalter

## Zweck
Schaltung von hohen Lasten (230V, hohe Ströme) über niedrige Steuerspannung für Lampen, Heizungen, Motoren oder andere Geräte.

## Anschluss
```
ESP32     Relais-Modul     Last
GPIO5 ->  IN              
3.3V  ->  VCC             
GND   ->  GND             
          COM    <->      L (Phase)
          NO     <->      Gerät
          NC     (nicht verwendet)
```

## Relais-Typen
- **Mechanisch**: Klassisches elektromagnetisches Relais (klick-Geräusch)
- **Solid State (SSR)**: Lautlos, schneller, aber teurer
- **Reed-Relais**: Sehr schnell, niedrige Ströme

## Schaltleistungen
| Relais-Typ | Spannung | Strom | Anwendung |
|------------|----------|-------|-----------|
| 5V Modul   | 250V AC  | 10A   | Haushaltsgeräte |
| SSR 25A    | 380V AC  | 25A   | Heizungen |
| Reed       | 200V     | 0.5A  | Signale |

## Sicherheitshinweise
⚠️ **ACHTUNG: Hochspannung!**
- **Nur bei ausgeschalteter Sicherung** arbeiten
- **Phasenleiter (L) schalten**, nicht Nullleiter (N)
- **Kabelquerschnitt** nach Last dimensionieren
- **Gehäuse** mit Berührungsschutz verwenden

## Erweiterte Konfiguration
```yaml
switch:
  - platform: gpio
    pin: 
      number: GPIO5
      inverted: false  # true bei inverted logic
    name: "${friendly_name} Relais"
    id: main_relay
    icon: "mdi:power-socket-eu"
    restore_mode: RESTORE_DEFAULT_OFF
    device_class: outlet
    
    # Einschalt-Verzögerung (Soft-Start)
    on_turn_on:
      - logger.log: "Relais wird eingeschaltet..."
      - delay: 100ms  # Kurze Verzögerung
      - logger.log: "Relais ist an"
    
    # Sanftes Ausschalten
    on_turn_off:
      - logger.log: "Relais wird ausgeschaltet..."
      - logger.log: "Relais ist aus"

# Optional: Strom-/Leistungsmessung
sensor:
  - platform: template
    name: "${friendly_name} Betriebszeit"
    id: runtime
    unit_of_measurement: "s"
    accuracy_decimals: 0
    lambda: |-
      static unsigned long start_time = 0;
      if (id(main_relay).state) {
        if (start_time == 0) start_time = millis();
        return (millis() - start_time) / 1000.0;
      } else {
        start_time = 0;
        return 0;
      }
    update_interval: 1s

# Optional: Automatisches Ausschalten nach Zeit
script:
  - id: auto_off_timer
    parameters:
      minutes: int
    then:
      - logger.log: !lambda 'return "Auto-Off Timer: " + to_string(minutes) + " Minuten";'
      - delay: !lambda 'return minutes * 60 * 1000;'
      - switch.turn_off: main_relay
      - logger.log: "Automatisch ausgeschaltet"

# Button für timed operation  
button:
  - platform: template
    name: "${friendly_name} 30min Timer"
    on_press:
      - switch.turn_on: main_relay
      - script.execute:
          id: auto_off_timer
          minutes: 30
```

## Relais-Logik
- **Normal (NO)**: Relais off = Stromkreis offen
- **Inverted**: Relais off = Stromkreis geschlossen
- **Active Low**: GPIO LOW schaltet Relais ein

```yaml
# Für Active-Low Relais
pin: 
  number: GPIO5
  inverted: true
```

## Mehrfach-Relais Module
```yaml
# 4-Kanal Relais Modul
switch:
  - platform: gpio
    pin: GPIO5
    name: "Kanal 1"
    
  - platform: gpio  
    pin: GPIO18
    name: "Kanal 2"
    
  - platform: gpio
    pin: GPIO19  
    name: "Kanal 3"
    
  - platform: gpio
    pin: GPIO21
    name: "Kanal 4"
```

## Anwendungsbeispiele
- **Smart Steckdosen**: Fernsteuerung von Geräten
- **Heizungssteuerung**: Thermostat-Ersatz
- **Beleuchtung**: 230V Lampen schalten
- **Garagentor**: Motor-Steuerung
- **Bewässerung**: Ventile und Pumpen

## Interlock (Verriegelung)
```yaml
# Verhindert gleichzeitiges Einschalten
switch:
  - platform: gpio
    pin: GPIO5
    name: "Motor Vor"
    id: motor_forward
    interlock: [motor_backward]
    
  - platform: gpio
    pin: GPIO18  
    name: "Motor Zurück"
    id: motor_backward
    interlock: [motor_forward]
```

## Troubleshooting
- **Relais klickt nicht**: Stromversorgung/Verkabelung prüfen
- **Keine Schaltung**: Kontakte verschlissen/verbrannt
- **Dauerhaftes Schalten**: Kontaktprellen, Entstörung nötig
- **Überlastung**: Relais-Nennstrom vs. tatsächliche Last

## Entstörung bei induktiven Lasten
```yaml
# Für Motoren/Transformatoren
switch:
  - platform: gpio
    pin: GPIO5
    name: "Motor"
    on_turn_off:
      - delay: 50ms  # Lichtbogen abklingen lassen
```
