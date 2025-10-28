# 12V RGB LED Controller mit Bewegungsmelder (LOKAL! Funktioniert auch, wenn HA ausfällt!)
Dieses ESPHome Projekt ist ein einfacher Code, der bei Bewegung RGB LEDs einschaltet und nach einem Timeout (2 Minuten) wenn keine Bewegung mehr stattgefunden hat wieder abschaltet.  
Um die LEDs dauerhaft anzuschalten und nicht nach Timeout ausgehen zu lassen, gibt es einen zusätzlichen Switch.  
Die LEDs können über Home Assistant gesteuert werden. Der Bewegungsmelder funktioniert aber auch weiter, wenn Home Assistant ausfällt.  
Soll das Gerät vollständig standalone ohne Home Assistant verwendet werden, muss der "api" Eintrag auskommentiert werden.  
  
  
# Anmerkungen
Der Code basiert auf dem Hardware Projekt zu meinem ersten ESPHome 12V RGB LED Controller:  
https://www.smarthomeyourself.de/diy-collections/hardware/hardware-rgbw-led-wifi-controller-12v  
  
Der Bewegungsmelder ist dabei am D1 Pin auf der Platine angeschlossen, und erhält Strim über die Pins 3V3 und GND.  