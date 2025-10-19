# Garagentor Controller incl. RGB LEDs mit ESPHome für Home Assistant
Mit dieser Anleitung steuerst du dein Garagentor nicht nur elektrisch, sondern verpasst ihm auch eine coole Adresse-LED-Animation via ESPHome und WS2812-ähnlichen Streifen.  
Komplett lokal gesteuert.  
  
## Ziel & Umsetzung  
- Integriere dein Garagentor in Home Assistant zur Anzeige des Zustands (geöffnet/geschlossen) und zur Steuerung per App oder Sprachassistent.  
- Führe eine LED-Animation durch, die den Öffnungs-/Schließvorgang visuell darstellt – gesteuert von einer Platine mit ESPHome-Firmware (keine zusätzlichen Automationen nötig!).  
- Erhalte Steuerung des vorhandenen Tasters, aber auch eine Steuerung über Relais über die Platine.  
- Zwei Sensoren erfassen den Zustand „vollständig geöffnet“ und „vollständig geschlossen“.  
  
## Komponentenübersicht
- ESP8266 (z. B. D1 mini) mit ESPHome-Firmware  
- Relais zur Ansteuerung des Garagentormotors  
- Zwei Endlagensensoren (Öffnen + Schließen)  
- Adresse LED-Streifen (z. B. WS2812) für Animation  
- Kleine Steuerplatine + optionales 3D-Gehäuse (siehe Blog)  
  
## Anschluss & Hinweise  
1. Taster-Signal vom vorhandenen Motortaster abgreifen → Platine übernimmt Relaissteuerung.  
2. Sensoren anschließen für Zustandserkennung „offen“ und „geschlossen“.  
3. LED-Streifen anschließen – Achtung: Signalqualität wichtig, bei schnellen Effekten kann der default Pegelwandler stören.  
4. Netzteil passend dimensionieren! (Controller + LED-Streifen)  
  
## Hinweise & Tipps
- Wenn die Leitung zur ersten LED sehr kurz ist, kann der Pegelwandler entfallen – Signal ggf. direkt vom ESP.  
- Bei längerer Leitung besser einen geeigneten Pegelwandler (z. B. 74AHCT125) einsetzen.  
- Stelle sicher, dass das System auch ohne Home Assistant funktioniert – deine Logik liegt auf der Platine.  
- 3D-Gehäuse zur sauberen Montage bietet Schutz und gutes Finish.  
  
## Anleitung  
Eine ausführliche Anleitung des Projektes findet Ihr unter:  
https://www.smarthomeyourself.de/blog/motorisiertes-garagentor-mit-rgb-led-animation  
  
**Die Platine findet Ihr auch bei ELECROW.com unter folgendem Link:**  
https://www.elecrow.com/sharepj/smart-garage-door-control-with-animated-rgb-led-804.html  
  
## Video zum Projekt:  
**Video zur RGB-LED Treppenbeleuchtung:**  
[![Smarte Garagentor-Steuerung mit automatischer RGB-LED Beleuchtung](http://img.youtube.com/vi/NvoPeyG30WA/0.jpg)](https://www.youtube.com/watch?v=NvoPeyG30WA "Video zur Smarte Garagentor-Steuerung mit RGB-LEDs mit ESPHome")  
  
  