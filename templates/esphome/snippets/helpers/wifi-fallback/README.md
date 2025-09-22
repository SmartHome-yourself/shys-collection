# WiFi Fallback & Captive Portal

## Zweck
Robuste WiFi-Konfiguration mit automatischem Fallback-Hotspot für einfache Konfiguration und Diagnose.

## Funktionen
- **Automatischer Fallback**: Bei WiFi-Problemen wird ein eigenes Netzwerk erstellt
- **Captive Portal**: Einfache Web-Konfiguration über Smartphone
- **WiFi-Diagnose**: Signal, IP-Adresse, SSID-Informationen
- **Energiesparmodus**: Reduziert Stromverbrauch im Batteriebetrieb

## Secrets-Konfiguration
Erstelle eine `secrets.yaml` Datei:
```yaml
wifi_ssid: "Dein-WiFi-Name"
wifi_password: "dein-wifi-passwort"
ap_password: "fallback-passwort"  # Min. 8 Zeichen
```

## Fallback-Verhalten
1. **Normale Verbindung**: Gerät verbindet sich mit konfiguriertem WiFi
2. **Verbindungsfehler**: Nach 1 Minute wird Fallback-Hotspot aktiviert
3. **Captive Portal**: Smartphone zeigt automatisch Konfigurationsseite
4. **Automatische Wiederverbindung**: Versucht regelmäßig normale WiFi-Verbindung

## Nutzung des Fallback-Hotspots
1. Mit Smartphone/Laptop nach WiFi-Netzwerk "${friendly_name} Fallback" suchen
2. Passwort eingeben (aus secrets.yaml)
3. Browser öffnet automatisch Konfigurationsseite
4. Neue WiFi-Einstellungen eingeben und speichern

## Energiesparmodus
- `none`: Volle Leistung, beste Verbindung
- `light`: Leichtes Energiesparen, gute Balance
- `high`: Maximales Energiesparen, langsamere Verbindung

## Diagnose
- **WiFi Signal**: Empfangsstärke in dBm
- **IP-Adresse**: Aktuelle Netzwerkadresse  
- **SSID/BSSID**: Verbundenes Netzwerk
- **Status**: Online/Offline-Anzeige

## Tipps
- `fast_connect` beschleunigt Verbindungsaufbau
- `reboot_timeout` startet Gerät neu bei dauerhaften WiFi-Problemen
- Statische IP kann bei Netzwerkproblemen helfen
- Fallback-Passwort sollte sicher sein (min. 8 Zeichen)
