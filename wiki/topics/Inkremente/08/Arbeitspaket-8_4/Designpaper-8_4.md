# Designpaper 8.4

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 8 \
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 4 \
**Autor**: Simon Blum \
**Datum**: 18.02.2025 \
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Simon Blum \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 18.02.2025 \
**Version**: 1 \
**Prüfer**: Ben Oeckl \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Ben Oeckl \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 20.02.2025

### Changelog

| Datum      | Verfasser  | Kurzbeschreibung                  |
| ---------- | ---------- | --------------------------------- |
| 18.02.2025 | Simon Blum | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper
Zur Bearbeitung dieses Arbeitspaketes wird der im Klassendiagramm zu
findende MetadataHandler erstellt.

Über diesen werden die nötigen Schnittstellen bereitgestellt um
das Deserialisieren von Dateien und Pfaden zu vereinfachen.

Um wiederholtes laden zu speichern werden bereits geladene Instanzen
in einer HashMap zwichengespeichert. Dieser Schritt führt eine
weitere Caching Ebene ein. Gegebenenfalls sollte dies aber wieder
entfernt werden um ein doppeltes zwichenspeichern im Front- und Backend
zu vermeiden. Bei Implementierung der Tauri-Commands sollte sich
hiermit auseinandergesetzt werden.
