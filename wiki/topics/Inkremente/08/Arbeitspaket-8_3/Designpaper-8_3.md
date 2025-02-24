# Designpaper 8.3

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 8\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: 3\
**Autor**: Simon Blum\
**Datum**: 17.02.2025\
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_:\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: \
**Version**: 1 \
**Prüfer**: Max Rodler\
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 

### Changelog

| Datum      | Verfasser | Kurzbeschreibung                  |
| ---------- | --------- | --------------------------------- |
| 17.02.2025 | ????????  | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Designpaper
Für die Config soll ein seperates Modul erstellt werden. Entlang des
Klassendiagram wird eine Struktur für die Config selbst und eine für 
den ConfigHandler erstellt.

Die Config selbst speichert den Pfad der Datenbank, Pfade von Dateien
und Pfade von Verzeichnissen. Der Pfad der Config wird im ConfigHandler
gespeichert.

### Pfade
Für die Pfade sollen systemspezifische defaults verwendet werden, welche
gängigen Konventionen folgen.
#### Config
Unix-like (falls eine Umgebungsvariable nicht vorhanden, das nächste):
1. $XDG_CONFIG_HOME/episko/config.toml
2. $HOME/.config/episko/config.toml
Windows:
- %APPDATA%/episko/config.toml
#### Datenbank
Unix-like:
1. $XDG_CACHE_HOME/episko/cache.db
2. $HOME/.cache/cache.db
Windows:
- %LOCALAPPDATA%/episko/cache.db

### Serialisierung/Deserialisierung
Für das serialisieren und deserialisieren der Config Datei wird
das bereits vorhandene `files` Modul und der darin vertretene
`FILE` trait verwendet.

