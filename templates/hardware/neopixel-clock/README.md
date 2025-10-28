# RGB-LED Uhr mit LED-Matrix-Display und Neopixel Ring
Die Uhrzeit wird über den Neopixel-Ring angezeigt wie auf einer analogen Uhr.  
Das LED-Matrix-Display zeigt standardmäßig das Datum an. Kann aber auch mittels Lauftext beliebige Statusmeldungen darstellen.  

## Funktionen
Die Uhr gleicht die Uhrzeit mit dem Home Assistant Server ab und hält die Uhrzeit über eine RTC.  
Die LED-Matrix zeigt das aktuelle Datum an.  
Über einen Serviceaufruf der durch das einbinden der Uhr in Home Assistant zur Verfügung gestellt wird können Statusmeldungen auf der LED-Matrix ausgegeben werden. Die Texte werden, sobald sie zu lang für das Display sind, automatisch als durchlaufender Text angezeigt.  
  
## Bauteile
D1 Mini: https://amzn.to/3CFKHGM *  
Neopixel-Ring: https://amzn.to/3B1SnSB *  
TinyRTC: https://amzn.to/3AYha9P *  
LED-Matrix Display: https://amzn.to/3cvVMzo *  
5V Netzteil: https://amzn.to/3ebv0wV *  
5V Buchse: https://amzn.to/3e7MWIC *  
  
## 3D-Druck Dateien für das Gehäuse:
https://www.thingiverse.com/thing:5487026  
  
  
## Projekt Code
Im ESPHome Projekt müssen nur die Substitutions angegeben und das Package geladen werden.  
  
```
substitutions:
  # Der devicename muss dem Dateinamen der YAML-Datei entsprechen
  devicename: shys-neopixel-uhr
  
  # Der friendly_name ist der Anzeige-Name und frei wählbar
  friendly_name: "Neopixel Uhr"

  # WLAN Zugangsdaten
  wifi_ssid: !secret wifi_ssid
  wifi_password: !secret wifi_password

  # Verfügbare Animationen:
  # - Uhr1
  # - Uhr2
  uhr_animation: "Uhr2"
  
  # Minimale Helligkeit der LEDs
  minimum_brightness: "30"
  
# Neopixel-Uhr als Package laden
packages:
  neopixel_uhr_package: github://SmartHome-yourself/esphome-neopixel-uhr/neopixel-uhr.yaml@main
```  
  
## API-Encryption
Wer jetzt noch seine eigenen Sicherheitsschlüssel für die API-Verschlüsselung und/oder OTA verwenden möchte kann diese wie gewohnt einfach angeben und somit den Standard überschreiben:
```
# Generiere einen eigenen encryption key unter: https://esphome.io/components/api.html
api:
  encryption:
    key: "+xGZsEOk6f+w1+8/m2cQBVRBZXBTBwh85Ivxl+ODUco="

ota:
  password: "HierDeinOTA-PW"
```

Der Standard API-Encryption Key lautet: **99xlZAKGxtHBJYZzZ3Tee9t5s4yEwKlOS0ZBIOOCQOs=**  
  
## Service
Um einen Text von Home Assistant aus auf der Uhr auszugeben, sieht ein Serviceaufruf wie folgt aus:
```
service: esphome.neopixel_uhr_write_text
data:
  text: info text
```
_Dabei entspricht im Service-Namen das "neopixel_uhr" dem Geräte-Namen welcher unter **upper_devicename** in den Subscriptions angegeben wurde._
  

## Benötigte Schriftart "Pixelmix"
Das LED-Display benötigt noch die Schriftart Pixelmix. Diese könnt Ihr unter folgendem Link herunterladen:  
https://www.dafont.com/pixelmix.font  
  
Kopiert die ttf-Datei anschließend in euer ESPHome-Verzeichnis (Bei Home Assistant liegt dies unter /config/esphome)


## Betrieb ohne Home Assistant
Generell ist die Uhr natürlich darauf ausgelegt in Kombination mit Home Assistant betrieben zu werden. 
Sie kann aber auch standalone genutzt werden.
Dabei ist aber zu beachten, dass im normalfall der ESP alle 15 Minuten neu startet, sofern sich kein Gerät über die API mit ihm verbindet.
Um diesen Neustart zu vermeiden muss unter dem API-Eintrag der Parameter **reboot_timeout** auf 0s gesetzt werden.
```
api:
  reboot_timeout: 0s
```
  
  
  
## Video zur Uhr
[![Neopixel-Clock](http://img.youtube.com/vi/4dabOY53DU4/0.jpg)](https://www.youtube.com/watch?v=4dabOY53DU4 "Neopixel Uhr mit ESPHome")


