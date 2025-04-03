# Designpaper 6.3

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 6 \
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 3 \
**Autor**: Paul Stöckle \
**Datum**: 20.01.2025 \
**Zuletzt geändert**: 20.01.2025 \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Paul Stöckle \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 25.01.2025 \
**Version**: 2 \
**Prüfer**: Max Rodler \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Max Rodler \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 27.01.2025

### Changelog

| Datum      | Verfasser    | Kurzbeschreibung                  |
|------------|--------------|-----------------------------------|
| 20.01.2025 | Paul Stöckle | Initiales Erstellen und Verfassen |
| 25.01.2025 | Paul Stöckle | Designänderungen                  |

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
### Commands, Argumente und Funktionalitäten
| Command                 | Funktion                                                                                                                                        |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| create [OPTIONS]        | Erstellen einer neuen Manifestdatei. Daten können durch Flags mitgegeben werden. Alle anderen werden durch interaktiv eingegeben Daten ergänzt. |
| create [OPTIONS mit -n] | Erstellen einer neuen Manifestdatei. Daten werden nur den Flags entnommen. Bei relevanten Daten, die fehlen wird das Programm abgebrochen.      |
| remove \<FILE>          | Löschen der angegeben Datei und Entfernung der Informationen aus dem System.                                                                    |
| add \<FILE>             | Hinzufügen der angegeben Datei zum System.                                                                                                      |
| validate \<FILE>        | Validerung auf Gültigkeit der angegeben Datei.                                                                                                  |

### Code-Isolation
Die CLI wird in einem eigenen Paket entwickelt: "episko_cli". Die verschiedenen Komponenten werden auf mehrere Dateien aufgeteilt. Zur Argumentübergabe wird clap genutzt. Zur interaktiven Eingabe wird dialoguer benutzt.
