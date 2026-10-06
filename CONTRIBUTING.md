# Mitwirken

Beiträge sind willkommen, wenn sie die OER verständlicher, besser nutzbar oder vielfältiger machen. Für alle Beiträge gilt der [Verhaltenskodex](CODE_OF_CONDUCT.md).

> **English summary.** Contributions are welcome. Open an issue first for larger changes. Use Conventional Commits. Run `npm run check` before you open a pull request.

## Rückmeldungen

Öffnen Sie ein [Issue](https://github.com/maehr/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop/issues/new/choose). Es gibt Vorlagen für Feedback zum Workshop, für Fehler im Material und für neue Fallkarten.

## Pull Requests

1. Öffnen Sie für grössere Änderungen zuerst ein Issue.
2. Erstellen Sie einen Fork und einen Branch, zum Beispiel `docs/fallkarte-museum`.
3. Installieren Sie die Werkzeuge mit `npm ci` und `uv sync`.
4. Starten Sie die Vorschau mit `npm run preview` und prüfen Sie Ihre Änderung.
5. Prüfen Sie Formatierung und Linting mit `npm run check`. `npm run format` korrigiert die Formatierung.
6. Schreiben Sie Commit-Nachrichten nach [Conventional Commits](https://www.conventionalcommits.org/de/v1.0.0/), zum Beispiel `docs: Fallkarte aus einem Museum ergänzen`.
7. Halten Sie einen Pull Request auf eine logische Änderung beschränkt.

## Neue Fallkarten

Eine Fallkarte enthält Ausgangsmaterial mit Link auf den Originaldatensatz, Kontext, Arbeitsauftrag, mögliche Analysepunkte und Hinweise für Kursleitende. Die Analysepunkte und Hinweise gehören auf die Seite `kurs/hinweise-fallkarten.qmd`, nicht auf die Karte selbst.

Verwenden Sie nur öffentlich zugängliche Datensätze. Decken Sie diskriminierende Begriffe in Screenshots ab, wenn die Analyse sie nicht braucht. Schreiben Sie nur Angaben auf die Karte, die der Datensatz belegt.

## Agents

Coding-Agents lesen zuerst [AGENTS.md](AGENTS.md).
