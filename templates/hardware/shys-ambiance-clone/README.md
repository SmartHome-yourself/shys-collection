# Philips Hue Ambiance Clone
Ein DIY-Projekt, mit dem du dir deine eigene smarte Ambient-Lampe im Stil der Philips Hue Ambiance baust – lokal steuerbar und komplett ohne Cloud.

## Idee
✅ Günstige Alternative zum Hue-Ambiance  
✅ Steuerbar über Home Assistant oder direkt per Taster  
✅ RGB-Licht mit einstellbarer Helligkeit und Farbe  
✅ Läuft vollständig lokal mit ESPHome  

## Komponenten
- Wemos D1 mini 
- WS2812B-LED-Streifen (adressierbar)  
- 2 Taster (z. B. für Power und Moduswechsel)  
- Passendes 5 V-Netzteil  
- Optional 3D-gedrucktes Gehäuse  

  
## Anleitung  
Eine ausführliche Anleitung des Projektes findet Ihr unter:  
https://www.smarthomeyourself.de/blog/philips-hue-ambiance-clone  
  
**Die Platine findet Ihr auch bei ELECROW.com unter folgendem Link:**  
https://www.elecrow.com/sharepj/philips-hue-ambiance-clone-diy-rgb-led-controller-811.html  
  
## Verwendete Bauteile:
**Wemos D1 mini:** https://amzn.to/42OP26M *  
**10k Widerstände:** https://amzn.to/43wrWSD *  
**Dioden:** https://amzn.to/3JjcrGS *  
**Taster:** https://amzn.to/4o47GAf *  
**RGB-LED-Stripes:** https://amzn.to/4hkQNhS *  

## Aufbau
Das Projekt basiert auf einem **Wemos D1 Mini** und **WS2812B-RGB-LEDs**.  
Bei meiner Version sind zusätzlich **zwei Taster** auf der Platine verbaut, sodass sich das Licht auch komplett offline bedienen lässt. Darüber kannst du die Farbe wechseln und die LEDs ein- oder ausschalten.  
Welche Funktion die Taster am Ende übernehmen, lässt sich über die ESPHome-YAML frei anpassen.

Die Platine übernimmt die gesamte Verdrahtung – du musst also nur:
✅ die **PCB bestücken**,  
✅ **LED-Streifen** und **Stromversorgung** anschließen  
und schon kann’s leuchten.

## Hinweise
- Für adressierbare LEDs gedacht (WS2812/WS2811)  
- Netzteil groß genug wählen, um Helligkeitsschwankungen zu vermeiden  
- Projekt funktioniert komplett ohne Cloud  
- Ideal als Nachttisch-, Regal- oder Deko-Licht

## Video
[![image](http://img.youtube.com/vi/yIegSiVpkys/0.jpg)](https://www.youtube.com/watch?v=yIegSiVpkys)  
