# Software Quality Assurance Report

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: -\
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: -\
**Autor**: Simon Blum\
**Datum**: 02.04.2025\
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: -\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: -\
**Version**: 1 \
**Prüfer**: Paul Stöckle\
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Paul Stöckle\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 03.04.2025

### Changelog

| Datum      | Verfasser  | Kurzbeschreibung                  |
|------------|------------|-----------------------------------|
| 02.04.2025 | Simon Blum | Initiales Erstellen und Verfassen |
| 03.04.2025 | Max Roder  | Formatierung und Korrekturen      |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---
1. Zusammenfassung der Qualitätssicherungstätigkeiten
    ○ Überblick über durchgeführte Prüfungen, Tests und Audits.

| Inkrement | Ergebnis             | Kommentar                    | 
|-----------|----------------------|------------------------------|
| 1         | Abgenommen           | Abweichendes Verfahren       |
| 2         | Abgenommen           | Abweichendes Verfahren       |
| 3         | Abgenommen           | Abweichendes Verfahren       |
| 4         | Abgenommen           | Abweichendes Verfahren       |
| 5         | Abgenommen           | Abweichendes Verfahren       |
| 6         | Teilweise Abgenommen | 2 Arbeitspakete verlängert   |
| 7         | Abgenommen           | -                            |
| 8         | Abgenommen           | -                            |
| 9         | Teilweise Abgenommen | Teils fehlende Dokumentation |

    - Mehr Information in Dokumentation
    - Manuelle Tests bei jedem Inkrement Review
    - CodeReviews vor jedem Merge (Abschluss Inkrement)

2. Konformität mit dem SQAP
   ○ Überprüfung, ob alle geplanten Qualitätssicherungsmaßnahmen durchgeführt wurden.
    - Automatisches Prüfen von Code-Qualität mit Clippy und SvelteCheck in Pipeline
    - Automatisches Formatieren mit Prettier und rustfmt in Pipeline
    - Automatische Testdurchführung in Pipeline
3. Ergebnisse der Verifikations- und Validierungsmaßnahmen
   ○ Testergebnisse, Fehleranalysen und Korrekturmaßnahmen.
    - Manueller Lasttest zunächst mit schlechter Nutzerfahrung bei vielen Manifesten
       -> Optimierung durch Pagination
   ○ Dokumentation der Einhaltung der Abnahmekriterien.
4. Audit- und Review-Ergebnisse
   ○ Festgestellte Abweichungen und nicht erfüllte Anforderungen.

| Requirement | Status            | Kommentar                                                           |
|-------------|-------------------|---------------------------------------------------------------------|
| FA1.2.2     | Teilweise erfüllt | Es wird geprüft, Ergebnisse der Prüfung jedoch ignoriert            |
| FA1.4.3     | Nicht erfüllt     | Keine Überprüfung bei Laden aus Konfiguration                       |
| FA2.2.3     | Teilweise erfüllt | Gelöschte Dateien werden nicht als solche erkannt                   |
| FA3.1.1     | Teilweise erfüllt | Daten können nur nach Titel durchsucht werden                       |
| NA4.1       | Nicht erfüllt     | Es wird nur ein ".deb" Artifact erstellt                            |
| NA10.1      | Nicht erfüllt     | Auf zukünftige Internationalisierung wurde keine Rücksicht genommen |


   ○ Maßnahmen zur Behebung identifizierter Probleme.
    - Aufgrund der modularen Architektur sind probleme leicht zu beheben
    - Keine kritischen Probleme, in Zukunft fixen
1. Qualitätsmetriken und Leistungsbewertung
   ○ Analyse der erfassten Qualitätsmetriken (z. B. Fehlerdichte, Code-Coverage).
    - C0: 48% - Unter Zielwert
    - C1: 56% - Unter Zielwert
    - Clippy keine Probleme
    - SvelteCheck keine Probleme
2. Lessons Learned und Empfehlungen
   ○ Identifikation von Verbesserungspotenzialen für zukünftige Projekte.
    - Egal
   ○ Vorschläge zur Optimierung von Qualitätssicherungsprozessen.
    - Frühere Implementation einer strukturierten Pipeline
3. Schlussfolgerungen und Freigabeempfehlungen
   ○ Gesamtbewertung der Softwarequalität.
    - Codequalität: Supi
    - Architektur: Supi
    - Testabdeckung: Naja
  ○ Empfehlung für die Freigabe oder notwendige Nachbesserungen.
    - Freigabe kann gegeben werden, keine kritischen Probleme
    - Ist keine kritische Anwendung
    - Stellenweise Verbesserungen möglich, jedoch nicht blockierend
