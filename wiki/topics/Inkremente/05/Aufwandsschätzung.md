# Aufwandsschätzung

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 5 \
**Autor**: Max Rodler \
**Datum**: 10.01.2025 \
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Paul Stöckle \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 17.02.2025 \
**Version**: 3 \
**Prüfer**: Simon Blum \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Simon Blum \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 17.02.2025

### Changelog

| Datum      | Verfasser    | Kurzbeschreibung                  |
|------------|--------------|-----------------------------------|
| 10.01.2025 | Max Rodler   | Initiales Erstellen und Verfassen |
| 24.01.2025 | Paul Stöckle | Faktor und Stunden hinzugefügt    |
| 17.02.2025 | Paul Stöckle | Function Points angepasst         |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

## Function Point Analyse

### Ungewichtete Function Points

| Teilaufgabe                        | Eingabe 3-4-6 | Abfrage 3-4-6 | Ausgabe 4-5-7 | Datenbestand 7-10-15 | Referenzdaten 5-7-10 | Summe |
|------------------------------------|---------------|---------------|---------------|----------------------|----------------------|-------|
| Anwendung starten                  |               | 6             | 5             |                      |                      | 11    |
| Metadaten anlegen                  | 6             |               |               | 10                   |                      | 16    |
| Metadaten bearbeiten               | 6             | 4             | 5             | 10                   |                      | 25    |
| Metadaten löschen                  |               |               |               | 7                    |                      | 7     |
| Datei angeben                      | 3             |               |               | 5                    |                      | 8     |
| Verzeichnis angeben                | 3             |               | 5             |                      | 7                    | 15    |
| Datei einlesen                     |               |               |               | 10                   | 7                    | 17    |
| Projekte suchen                    | 3             | 4             |               |                      |                      | 7     |
| Projekte filtern                   | 6             | 4             |               |                      |                      | 10    |
| Ergebnisse anzeigen (Suche+Filter) |               |               | 5             |                      |                      | 5     |
| Statistiken                        |               | 6             | 7             |                      |                      | 13    |

Summe: 134

### Gewichtete Function-Points

| Summe ungewichteter Function-Points               | 134    | individueller Kommentar                                         |
| ------------------------------------------------- | ------ | --------------------------------------------------------------- |
| Verflechtung mit anderen Anwendungssystemen (0-5) | 1      | Dateisystem                                                     |
| Dezentrale Daten, dezentrale Verarbeitung (0-5)   | 0      | Rein lokal                                                      |
| Transaktionsrate (0-5)                            | 1      | Reaktion auf Nutzerinteraktion                                  |
| Rechenoperationen (0-10)                          | 2      | Einfache Statistiken                                            |
| Kokntrollverfahren (0-5)                          | 2      | Prüfung von Checksums und Dopplungen                            |
| Ausnahmeregelungen (0-10)                         | 3      | Formprüfung                                                     |
| Logik (0-5)                                       | 1      | Suchalgorithmen                                                 |
| Wiederverwendbarkeit (0-5)                        | 3      | Interne Wiederverwendung teilweise möglich                      |
| Datenbestandskonvertierung (0-5)                  | 2      | Manifest <-> Datenbankinhalt                                    |
| Anpassbarkeit (0-5)                               | 1      | Einmalige Entwicklung (wenige optionale modulare Erweiterungen) |
| Summe der Einflussfaktoren (FE)                   | 16     |                                                                 |
| Faktor der Einflussbewertung (FE)                 | 0,86   |                                                                 |
| Gewichtete Funktion-Points                        | 115,24 |                                                                 |

Stunden pro Function-Point: 2 \
Gesamtstunden: 230
