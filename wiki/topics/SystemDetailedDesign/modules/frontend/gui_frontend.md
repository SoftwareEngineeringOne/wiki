# GUI Frontend

Das GUI Frontend gibt dem Nutzer die Möglichkeit, die durch die Metadateien angelegten Projekte, übersichtlich und intuitiv anzeigen und verwalten zu können.

## Verwendete Sprachen und Frameworks

Das GUI der Anwendung entspricht einer Web-Applikation, welche HTML und CSS nutzt und in Java-/ Typescript programmiert ist. Genutzt wird das [UI-Framework "Svelte" unter der Verwendung von "shadcn"](https://next.shadcn-svelte.com/), welches Grundlagen für die in der Anwendung verwendeten Komponenten bereitstellt.

Gefüttert wird das Frontend mit Einträgen aus der Datenbank und greift somit ausschließlich auf die Logik des Backends (Rust) zurück.

## Aufbau

Das implementierte Frontend ist in 2 Teile aufgeteilt:
- Unter "routes" befinden sich die verschiedenen "Seiten" der Anwendung. Hier wird der allgemeine Aufbau aller Seiten definiert, als auch der spezifische Aufbau einzelner Seiten angepasst. Diese Seiten werden größtenteils aus den Komponenten des UI-Frameworks aufgebaut.
- Alle verwendeten Komponenten sind unter "lib" zu finden. Hier werden die Inhalte des Frameworks abgelegt und können, bei Bedarf, für die eigene Verwendung angepasst werden.

