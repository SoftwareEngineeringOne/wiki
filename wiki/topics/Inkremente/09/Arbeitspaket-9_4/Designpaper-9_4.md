# Designpaper 9.4

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 9\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 4\
**Autor**: Paul Stöckle\
**Datum**: 05.03.2025\
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Paul Stöckle\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 05.03.2025\
**Version**: 1 \
**Prüfer**: Simon Blum\
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_:

### Changelog

| Datum      | Verfasser    | Kurzbeschreibung                  |
|------------|--------------|-----------------------------------|
| 05.03.2025 | Paul Stöckle | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper

In der episko_lib wird eine neue Komponente mit einem Statistiken-Struct, der die Daten strukturiert hält, benötigt.
Die Ausgabedaten werden mit Hilfe von Eingabedaten aus der Datenbank erstellt. Die SQL-Statements werden in die
Datenbankkomponente ausgelagert.

## Initiale Statistiken

| Beschreibung                    | Interne Darstellung    |
|---------------------------------|------------------------|
| Anzahl Projekte nach Sprache    | Map <Language, Int>    |
| Anzahl Projekte nach IDE        | Map <Ide, Int>         |
| Anzahl Projekte nach Kategorie  | Map <String, Int>      |
| Anzahl Projekte nach Bau-System | Map <BuildSystem, Int> |
| Anzahl aller Projekte           | Int                    |
