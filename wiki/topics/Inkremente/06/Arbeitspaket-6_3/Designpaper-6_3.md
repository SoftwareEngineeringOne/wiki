# Designpaper 6.Y

---

### Übersicht

**Projekt**: Projekt Episkos \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 6\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 3\
**Autor**: Paul Stöckle\
**Datum**: 20.01.2025\
**Zuletzt geändert**: 20.01.2025\
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Paul Stöckle\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 20.01.2025\
**Version**: 1 \
**Prüfer**: \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 

### Changelog

| Datum      | Verfasser | Kurzbeschreibung                  |
| ---------- | --------- | --------------------------------- |
| 20.01.2025 | Paul Stöckle  | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper
Im Rahmen des Arbeitspaketes soll die grundlegende Struktur der CLI-Komponente entwickelt werden.
### CLI
Es wird Clap zur Argumentübergabe verwendet.
### Argumente und Funktionalitäten
| Argument  | Funktion                                                                             |
| --------- | ------------------------------------------------------------------------------------ |
| -c        | Erstellen einer neuen Manifestdatei mithilfe von interaktiv eingegeben Daten         |
| -n [LIST] | Erstellen einer neuen Manifestdatei mithilfe der übergebenen komma-separierten Liste |
| -r [FILE] | Löschen der angegeben Datei und Entfernung der Informationen aus dem System          |
| -a [FILE] | Hinzufügen der angegeben Datei zum System                                            |

### Code-Isolation
Die CLI wird in einem eigenen Paket entwickelt: "episkos_cli".
