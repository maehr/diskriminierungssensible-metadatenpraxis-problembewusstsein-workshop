# Diskriminierungssensible Metadatenpraxis – OER für einen Hands-on-Kurs

[![Render and Publish](https://github.com/maehr/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop/actions/workflows/quarto-publish.yml/badge.svg)](https://github.com/maehr/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop/actions/workflows/quarto-publish.yml)
[![Lizenz Inhalte: CC BY-SA 4.0](https://img.shields.io/badge/Inhalte-CC%20BY--SA%204.0-lightgrey.svg)](LICENSE-CCBYSA.md)
[![Lizenz Code: AGPL-3.0](https://img.shields.io/badge/Code-AGPL--3.0-blue.svg)](LICENSE-AGPL.md)

Diese Open Educational Resource (OER) enthält alle Materialien für einen 60- bis 90-minütigen Hands-on-Kurs zu diskriminierungssensibler Metadatenpraxis. Kursleitende können den Kurs ohne die Autor:innen durchführen. Der Kurs schafft Problembewusstsein für Diskriminierung in und durch Daten und Metadaten.

**Website:** <https://maehr.github.io/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop/>

> **English summary.** This repository holds an open educational resource in German. It supports a 60 to 90 minute hands-on workshop on discrimination-sensitive metadata practice for researchers and GLAM staff. It contains a facilitator guide, schedules for three formats, a slide deck, a metadata audit worksheet, five case cards and a transfer card. The website is built with Quarto.

## Inhalt

| Bereich          | Inhalt                                                                                                                              |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Kurs durchführen | Facilitator Guide: Lernziele, Vorbereitung, Abläufe für 60, 75 und 90 Minuten, Moderation, Content Note, Hinweise zu den Fallkarten |
| Input            | Foliendeck, Video, Kernkonzepte                                                                                                     |
| Hands-on         | Metadaten-Audit, Anleitung für eigene Beispiele, fünf Fallkarten                                                                    |
| Arbeitshilfen    | Verweise auf die Checklisten des Handbuchs                                                                                          |
| Nach dem Kurs    | Transfer-Karte, weiterführende Lektüre                                                                                              |
| OER verwenden    | Lizenz, Downloads, Quelldateien, Feedback                                                                                           |

Die OER baut auf dem Handbuch [_Diskriminierungssensible Metadatenpraxis_](https://moritz-maehr.quarto.pub/diskriminierungssensible-metadatenpraxis/) auf. Die Spezifikation der OER steht in [SPECS.md](SPECS.md).

## Repository-Struktur

```text
index.qmd            Startseite
kurs/                Facilitator Guide
input/               Slides, Video, Kernkonzepte
slides/              Quelldatei, Theme, Bilder und PDF des Foliendecks
hands-on/            Metadaten-Audit, eigenes Beispiel, Fallkarten
arbeitshilfen/       Verweise auf die Checklisten des Handbuchs
nach-dem-kurs/       Transfer-Karte, Lektüre
oer/                 Lizenz, Downloads, Quelldateien, Feedback
_partials/           Textbausteine für mehrere Seiten
_extensions/oer/      Druckvorlage (Typst) für die PDF-Fassungen
site.scss            Typografie und Farben der Website
assets/              Favicon und bearbeitete Bilder
scripts/             Hilfsskript für das Release-Archiv
```

## Lokal arbeiten

Voraussetzungen: [Quarto](https://quarto.org/docs/get-started/) 1.10, [Node.js](https://nodejs.org/) 24 oder neuer und [uv](https://docs.astral.sh/uv/).

```bash
npm ci            # Node-Werkzeuge und Git-Hooks installieren
uv sync           # Python-Werkzeuge installieren
npm run preview   # Vorschau mit Live-Reload starten
npm run check     # Formatierung und Linting prüfen
```

GitHub Actions rendert und veröffentlicht die Website bei jedem Push auf `main`. Commits folgen [Conventional Commits](https://www.conventionalcommits.org/de/v1.0.0/). Ein Git-Hook prüft die Commit-Nachricht.

## Lizenz

- Inhalte: [CC BY-SA 4.0](LICENSE-CCBYSA.md)
- Code (Konfiguration, Workflows, Skripte): [AGPL-3.0-only](LICENSE-AGPL.md)
- Ausnahme: Screenshots von Datensätzen Dritter stehen nicht unter diesen Lizenzen. Für sie gelten die Rechte der jeweiligen Institutionen.

## Zitieren

Zitieren Sie die OER mit den Angaben in [CITATION.cff](CITATION.cff). Nach dem ersten Release auf Zenodo steht hier der DOI.

## Mitwirken

Rückmeldungen und Beiträge sind willkommen. Siehe [CONTRIBUTING.md](CONTRIBUTING.md) und den [Verhaltenskodex](CODE_OF_CONDUCT.md).

## Autor:innen

- Moritz Mähr, Universität Bern, Digital Humanities ([ORCID](https://orcid.org/0000-0002-1367-1618))
- Noëlle Schnegg, Sciences Po ([ORCID](https://orcid.org/0009-0008-5207-6652))
