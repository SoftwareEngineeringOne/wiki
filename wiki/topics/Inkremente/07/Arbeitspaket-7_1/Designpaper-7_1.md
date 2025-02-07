# Designpaper 7.1

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 7\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 1\
**Autor**: Simon Blum\
**Datum**: 04.02.2025\
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: -\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: -\
**Version**: 1 \
**Prüfer**: Max Rodler\
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 

### Changelog

| Datum      | Verfasser  | Kurzbeschreibung                  |
|------------|------------|-----------------------------------|
| 04.02.2025 | Simon Blum | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper
Im Rahmen des Arbeitspaket soll ein neues Modul in der `episko_lib` geschaffen werden. Anhand diesem soll ein einfacher Zugriff
auf die Datenbank in den Frontend Anwendung ermöglicht werden.

### Struktur
In der bestehenden Struktur gibt es insbesondere 2 Fälle zu betrachten:

#### Advanced Properties
Die Properties wie "Category" oder "Language" sollen auch in der Datenbank gespeichert werden. Da alle diese Eigenschaften sehr änhlich sind
und über den `Property` trait auch bereits viel gemeinsames Verhalten teilen, soll auch für Datenbankoperationen eine saubere und geteilte
Implementation gefunden werden. Naheliegend wäre hierbei bspw. die Verwendung eines Macros.

#### Metadata
Das Metadaten Objekt selbst muss hierbei gesondert behandelt werden, da die entstehenden Relationen vor Interkation mit der Datenbank
entsprechend etabliert/geprüft werden müssen.

### Datenbank
Für die Datenbank soll `sqlite` verwendet werden. Hierzu muss ein Schema erarbeitet werden. Alle Informationen hierzu werden im Software Design Paper
zu finden sein.
