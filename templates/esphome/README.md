# ESPHome

### Was ist ESPHome?
ESPHome erzeugt Firmware für ESP32/ESP8266 aus **lesbaren YAML‑Configs**. Ideal für Sensoren, Aktoren, Gateways und Spezial‑Setups – perfekt für Home Assistant.  
• Doku: https://esphome.io/  
• Releases/Breaking Changes: https://esphome.io/changelog/

### Ordner
- `snippets` → kleine, wiederverwendbare YAML‑Bausteine (Sensoren, Aktoren, Helpers, Networks). **Je Snippet eigener Ordner.**
- `setups` → komplette, lauffähige Konfigurationen **ohne** eigene PCB (z. B. BLE‑Proxy, Presence‑Hub, MQTT‑Bridge). **YAML-Dateien liegen direkt im Projekt-Root.**

### Schnellstart
1. ESPHome installieren (Addon oder CLI).  
2. Snippet/Setup auswählen.  
3. YAML öffnen, ggf. `substitutions:` anpassen, **WLAN/Secrets** eintragen.  
4. Flashen (USB) oder OTA.

### Beachte
- **Version**: Orientiere dich an aktuellen ESPHome‑Versionen (mind. im README nennen).  
- **Pins/Spannung**: Prüfe Board‑Pinout & Pullups/Pulldowns (I²C/SPI).  

