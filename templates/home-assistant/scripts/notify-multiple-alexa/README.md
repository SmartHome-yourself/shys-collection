# Notify Alexa All

Dieses Script sendet eine Sprachnachricht an definierte Alexa-Geräte.  
Über den Parameter `default_speakers` kannst du steuern, ob nur eine reduzierte oder die vollständige Geräteliste angesprochen wird.
Mit dem Parameter `message` wird die Nachricht übergeben, die die Echos ausgeben sollen.

## Aufruf

In einer Automation wird das Script wie folgt aufgerufen:

```yaml
action: script.notify_alexa_all
data:
  live_on_stage: true
  message: "Das ist ein Test!"
