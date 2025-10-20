# Philips Hue Ambiance Clone
Ein DIY-Projekt, mit dem du dir deine eigene smarte Ambient-Lampe im Stil der Philips Hue Ambiance baust – lokal steuerbar und komplett ohne Cloud.

## Idee
✅ Günstige Alternative zum Hue-Ambiance  
✅ Steuerbar über Home Assistant oder direkt per Taster  
✅ RGB-Licht mit einstellbarer Helligkeit und Farbe  
✅ Läuft vollständig lokal mit ESPHome  

## Komponenten
- Wemos D1 mini oder ESP32  
- WS2812B-LED-Streifen (adressierbar)  
- 2 Taster (z. B. für Power und Moduswechsel)  
- Passendes 5 V-Netzteil  
- Optional 3D-gedrucktes Gehäuse  

## Aufbau
📌 Netzteil, Board und LED-Streifen mit gemeinsamer Masse verbinden  
📌 Datenleitung der LEDs direkt an den ESP-Pin anschließen  
📌 Taster an freie GPIO-Pins legen  
📌 Gehäuse montieren und Strom anschließen  

## Hinweise
- Für adressierbare LEDs gedacht (WS2812/WS2811)  
- Netzteil groß genug wählen, um Helligkeitsschwankungen zu vermeiden  
- Projekt funktioniert komplett ohne Cloud  
- Ideal als Nachttisch-, Regal- oder Deko-Licht

## Video
[![image](http://img.youtube.com/vi/yIegSiVpkys/0.jpg)](https://www.youtube.com/watch?v=yIegSiVpkys)  
