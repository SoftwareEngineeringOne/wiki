# SDD - Episko derive

Die `episko_derive` crate ist ein [proc-macro](https://doc.rust-lang.org/reference/procedural-macros.html) welches die
Implementierung des [DatabaseObject]() traits für einfache Strukturen vereinfacht.

- Rust Crate: [episko_derive](https://crates.io/crates/episko_derive)
- Dokumentation: [docs.rs](https://docs.rs/episko_derive/latest/episko_derive/)

## Verwendete Sprachen
Der derive macro ist ausschließlich in der Programmiersprache Rust geschrieben.

## Verwendete Libraries
| Library     | Zweck                                                        | Version |
|-------------|--------------------------------------------------------------|---------|
| deluxe      | Parsen von derive Attributen wie `#[db(table = "category")]` | 0.5.0   |
| proc-macro2 | Wird im zu Zusammenhang mit `deluxe` verwendet               | 1.0.93  | 
| quote       | Umwandlung in TokenStreams                                   | 1.0.38  |
| syn         | Parsing von TokenStreams                                     | 2.0.98  |

## Verwendung

Für die Verwendung des Macros sind sowohl in der oben genannten Dokumentation der Crate als auch in 
[Dokumentation der Library](https://docs.rs/episko_derive/latest/episko_derive/) Beispiele zu finden.
