# Software Quality Assurance - Plan

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 8 \
**Autor**: Simon Blum \
**Datum**: 28.02.2025 \
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Max Rodler \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 28.02.2025 \
**Version**: 1 \
**Prüfer**: Ben Oeckl \
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Ben Oeckl \
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 03.03.2025

### Changelog

| Datum      | Verfasser  | Kurzbeschreibung                  |
|------------|------------|-----------------------------------|
| 28.02.2025 | Max Rodler | Initiales Erstellen und Verfassen |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

### Einleitung und Anwendungsbereich

#### Beschreibung des Projekts und der betroffenen Softwareprodukte:

- Verwaltungssoftware für Software-Projekte, anhand eigens dafür eingeführter Manifest-Dateien.

#### Zielsetzung und Geltungsbereich des Plans

- Sicherstellen der Codequalität durch das ganze Projekt. Setzt klare Vorgaben für Entwickler. Sorgt für eine konstante und durchgänge Qualitätssicherung.
- Soll Fehler präventiv ausschließen, um eine spätere Korrektur von Fehlern zu vermeiden. 

### Normative Referenzen

#### Rust:
- Code-Formatting nach Rust-Style-Guide (https://doc.rust-lang.org/nightly/style-guide/)
- Linting in CI-Pipeline via Clippy (nach ["Clippy 1.0 RFC"](https://doc.rust-lang.org/clippy/lints.html))

#### Svelte:
- Code-Formatting nach Svelte-Guide-Lines via Prettier (https://github.com/sveltejs/prettier-plugin-svelte)
- Linting in CI-Pipeline via SvelteCheck (https://svelte.dev/docs/cli/sv-check)

### Audit- und Bewertungskriterien

#### Audit
- Regelmäßige Reviews in jedem Inkrement
- Abschlussmeeting nach jedem Inkrement
- Beiträge zum Projekt nur via Pull-Requests

#### Metriken

- CI-Pipeline-Report

### Dokumentation und Berichterstattung

- Freigaben von Reviews erfolgen via GitHub
- Dokumentation findet in Inkrement-Dokumenten statt.
- Verweis auf SQAReport
