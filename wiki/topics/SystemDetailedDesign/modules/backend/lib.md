# Episko Lib
Die Library ist der zentrale Schlüsselpunktes des Projektes. Über sie wird
mit allen weiteren Modulen des Projektes kommuniziert.

- Rust Crate: [episko_lib](https://crates.io/crates/episko_lib)
- Dokumentation: [docs.rs](https://docs.rs/episko_lib/latest/episko_lib/)

## Verwendete Sprachen
Der Bibliothek ist ausschließlich in der Programmiersprache Rust geschrieben.

## Verwendete Libraries
| Library | Zweck | Version |
|---------|-------|---------|
| -       | -     |         |

## Aufbau
Die Library ist in die folgenden Module aufgeteilt, welche auch durch feature
flags identifiziert werden können, aufgeteilt:
- core 
- files (enabled by default)
- database (enabled by default)
- statistics (disabled by default)
_Im Kontext der Library stellt die Datenbank den persistenten Cache der Anwendung dar_

Dokumentation der einzelnen Module kann in der oben genannten Dokumentation gefunden werden.

