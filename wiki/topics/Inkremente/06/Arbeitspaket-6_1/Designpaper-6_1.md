# Designpaper 6.Y

---

### Übersicht

**Projekt**: Projekt Episkos \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 6\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: Y\
**Autor**: \
**Datum**: \
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: \
**Version**: 1 \
**Prüfer**: \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 

### Changelog

| Datum      | Verfasser | Kurzbeschreibung                  |
| ---------- | --------- | --------------------------------- |
| XX.XX.XXXX | ????????  | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper
Im Rahmen des Arbeitspaket soll ein Schnitstelle entstehen welche es erlaub Manifestdateien
zu serialisieren und zu deserialisieren.

### API Design
#### Serialisieren
- Input: Datenstruktur mit Metadaten
- Output: Erfolgreich?
- SideEffects: Datei wird geschrieben/erstellt
#### Deserialisieren
- Input: Pfad
- Output: Datenstruktur mit Metadaten
- SideEffects: Datei wird gelesen

### Code Aufbau
Für das Erstellen der Schnitstelle wird ein Modul in der "episko_lib" erstellt, welches
sowohl für die Cli als auch für das Gui Backend zur Verfügung steht.

### Referenz Klassendiagramm
Im Bezug auf das Klassendiagramm werden folgende Klassen als "structs" entstehen:
- Metadata
- Language
- IDE
- BuildSystem
- MetadataController (mit begrenzter Funktionalität)
- FileSystemHandler (mit begrenzter Funktionalität)

### Referenz Sequenzdiagramme
In diesem Arbeitspaket sollen Abschnitte aus folgenden den Sequenzdiagrammen behandelt werden:
- zu U1.2 (Sequenz zwichen MetadataController und FileSystemHandler, mit Schnitstelle zu App)


