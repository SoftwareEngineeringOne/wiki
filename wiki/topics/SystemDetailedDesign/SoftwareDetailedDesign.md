# Software Detailed Design

---

### Übersicht

**Projekt**: Projekt Episko \
**Autor**: Simon Blum \
**Datum**: 27.01.2025 \
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Paul Stöckle \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 07.02.2025 \
**Version**: 5 \
**Prüfer**: \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Ben Oeckl \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 08.02.2025

### Changelog

| Datum      | Verfasser    | Kurzbeschreibung                              |
|------------|--------------|-----------------------------------------------|
| 27.01.2025 | Simon Blum   | Initiales Erstellen und Verfassen             |
| 01.02.2025 | Paul Stöckle | Hinzufügen von CLI Modul                      |
| 03.02.2025 | Simon Blum   | Hinzufügen von Datenbank Modul                |
| 07.02.2025 | Simon Blum   | Hinzufügen von Links fürs Wiki                |
| 07.02.2025 | Paul Stöckle | Aktualisierung der CLI Library-Abhängigkeiten |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Übersicht Systemarchitektur

- Aufgeteilt in Lib, Cli, Gui
- Klassendiagramme/Sequenzdiagramme in Grobdesign
- Responsibility, wer macht was, was ist wo?
- Noch ein kleines Diagramm zu Komponentenübersicht?

```plantuml
@startuml
left to right direction
skinparam linetype ortho
skinparam nodesep 20
skinparam ranksep 130

skinparam package {
    BackgroundColor<<Frontend>> LightBlue
    BackgroundColor<<Backend>> LightGreen
    BackgroundColor<<Storage>> LightYellow
    BorderColor Black
}

package Frontend <<Frontend>> {
    component "CLI" as Cli
    component "GUI Frontend" as GuiFrontend
}

package Backend <<Backend>> {
    component "GUI Backend" as GuiBackend
    component "Lib" as Lib
    () DatabaseModule
    () FileModule
}

database Storage <<Storage>> {
    component "Database" as Database
    component "Manifest Files" as ManifestFiles
}

GuiBackend -down-> Lib : "uses"
Cli -right-> Lib : "uses"
GuiFrontend <---> GuiBackend : "tauri commands"
Lib <--> DatabaseModule
DatabaseModule <--> Database
Lib -- FileModule
FileModule <--> ManifestFiles

note as Note
Lib is technically incorporated by CLI/GUI
and not a separate entity during runtime.
end note
Lib .. Note
@enduml
```

## Module

### Backend - Datenbank

- [Mehr …](database.md)

### Backend - Lib

- [Mehr …](lib.md)

### Backend - Derive Macro

- [Mehr …](derive_macro.md)

### Backend - Gui

- [Mehr …](gui_backend.md)

### Frontend- Gui

- [Mehr …](gui_frontend.md)

### Frontend - Cli

- [Mehr …](cli.md)