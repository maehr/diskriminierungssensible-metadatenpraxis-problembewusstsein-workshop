# Agents Tooling Specification — Quarto

This repository is a German Open Educational Resource (OER) for a 60–90-minute hands-on workshop on discrimination-sensitive metadata practice. It is a Quarto website with a Reveal.js deck and printable worksheets. `SPECS.md` holds the content specification.

The rules below follow the shared [Agents Tooling Specification](https://gist.github.com/maehr/6c48ef14f37c9f745fa1fbaa315d106b) for Quarto (`30-AGENTS.quarto.md`). Sections 1, 3, 5, and 6 are unchanged. Sections 2, 4, and 7 are narrowed to this repository. The macOS toolbelt and the writing rules for scientific prose follow as appendices.

Section 3 names a single `LICENSE`. This repository splits the licence: `LICENSE-AGPL.md` covers code, and `LICENSE-CCBYSA.md` (CC BY-SA 4.0) covers content, the same licence as the handbook.

## 1. Orchestration

Context is the scarce resource. Manage it.

**Model tier.** A frontier model holds the plan, the decisions, and the shared context. A small model does a bounded subtask. Pick the tier before you spawn the agent.

**Delegate on evidence.** A subagent starts cold and derives the context again. Delegate work that reads far more than it reports: broad search, log triage, or fan-out over many files. Do a small local edit inline.

**Contracts, not conversations.** Give a subagent one task, the context it cannot infer, the output shape, and the stop condition. A subagent returns a conclusion, never a file dump. Verify a report before you act on it.

**Parallel only when independent.** Run agents at the same time only when no result feeds another. Use three at most.

**Context ladder.** At 25% of the window, name the source of the pressure. At 50%, reduce it: write state to disk, delegate the reading, or narrow the re-reads. At 75%, stop and reduce before further work.

**State on disk.** Write plans, findings, and decisions to files. The transcript dies at the next compaction.

**Read narrow.** Read the slice, not the file. After you write a file, verify the diff or the section you changed. Do not read the whole file again.

## 2. Tooling

`package.json` holds the contract. Call a script. Never call the tool that the script wraps.

| Script                                    | Use                                                                                       |
| ----------------------------------------- | ----------------------------------------------------------------------------------------- |
| `npm run preview`                         | Quarto preview with live reload. Use it while you edit.                                   |
| `npm run check`                           | The gate: Prettier check, ruff lint, and ruff format check.                               |
| `npm run format`                          | Prettier and ruff format.                                                                 |
| `npm run slides:pdf`                      | Decktape prints `_site/slides/folien.html` to `slides/folien.pdf`. Run it after a render. |
| `npm run changelog:unreleased`            | Compact preview of pending changelog entries.                                             |
| `npm run changelog`                       | git-cliff writes the changelog.                                                           |
| `npm run site:build`                      | Production render. CI only.                                                               |
| `npm run release:prepare -- --tag vX.Y.Z` | Render, archive, and stage the site ZIP. Maintainer only.                                 |
| `npm run lychee-check`                    | Link check. CI only.                                                                      |

**Quarto.** [Quarto](https://quarto.org/docs/guide/) CLI 1.10.18, pinned in `quarto-publish.yml` and `release.yml`. Develop against the same version · [quarto-cli-mcp](https://github.com/maehr/quarto-cli-mcp) renders and inspects from an agent session. It builds a temporary project and rejects an outside path, so it writes nothing into this repository.

**PDF and DOCX.** Use [Typst](https://quarto.org/docs/output-formats/typst.html) with `format: typst`. It needs no TeX. The printable pages declare `html`, `typst`, and `docx`: `hands-on/metadaten-audit.qmd`, `hands-on/eigenes-beispiel.qmd`, `hands-on/fallbeispiele/fall-*.qmd`, and `nach-dem-kurs/transfer.qmd`.

**Engine.** None. No page executes code. [uv](https://docs.astral.sh/uv/) manages Python only for `scripts/release_site_archive.py` and the dev tools `commitizen`, `ruff`, and `ty`. Commit `uv.lock`.

**Documents.** [Prettier](https://prettier.io/) formats Markdown, YAML, and JSON, and formats `.qmd` through the `--parser markdown` override in `.prettierrc` · [lychee](https://lychee.cli.rs/) checks links in CI · [prek](https://prek.j178.dev/) runs the hooks in `prek.toml`: `npm run check` on pre-commit and `cz check` on commit-msg · [commitizen](https://commitizen-tools.github.io/commitizen/) (`cz`) writes commits and bumps the version in `pyproject.toml` and `CITATION.cff` · [git-cliff](https://git-cliff.org/docs/) writes the changelog.

**Reference.** [open-research-data-template](https://github.com/maehr/open-research-data-template) is the source of the release archive and the GitHub Pages workflow.

## 3. Standards

- [SemVer 2.0.0](https://semver.org/) for versions.
- [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) for commit messages.
- [Contributor Covenant 3.0](https://www.contributor-covenant.org/version/3/0/code_of_conduct/) as `CODE_OF_CONDUCT.md`.
- [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.en.html) as `LICENSE`. SPDX identifier `AGPL-3.0-only`.

## 4. Code

**Preview while you edit.** Preview writes `_site/` and `.quarto/`. That is expected. Commit neither.

**Run no production render and no publish in an agent session** unless the maintainer asks. That covers `quarto publish`, the deploy workflow, and any release artifact. To check that a document still builds, use `quarto-cli-mcp`. It renders in a temporary project.

- Use `.qmd` for a Quarto document. Use `.md` for text that Quarto does not process.
- Give every document valid YAML front matter.
- Do not add an executable chunk. Ask the maintainer first, because the project has no engine and no `freeze`.
- Cite only from `references.bib`. Never invent a citation or its metadata. Take new entries from the handbook bibliography.
- Set `bibliography: ../references.bib` only on a page that cites. A project-wide bibliography also reaches the deck.
- Keep `_site/` and `.quarto/` untracked. The project sets no `freeze`, so keep `_freeze/` untracked.
- Put a new file in the directory that matches its role: `kurs/` (facilitators), `input/`, `hands-on/` (participants), `arbeitshilfen/`, `nach-dem-kurs/`, `oer/`, `_partials/` (shared snippets, not rendered), `assets/`, `scripts/`.
- Add each new page to `project.render` and to the sidebar in `_quarto.yml`. The sidebar mirrors section 17 of `SPECS.md`.

**OER content.** `SPECS.md` is the specification. Follow these rules for content:

- Keep facilitator material and participant material apart. Put the possible findings for a case card in `kurs/hinweise-fallkarten.qmd`, never on the card.
- Take facts about a record only from the linked record or its screenshot. Never invent a record fact.
- Reproduce a discriminatory term only when the analysis needs it. Mask it in a screenshot, as in `assets/images/fallkarten/*-maskiert.png`.
- Leave a blank line before a closing `:::` that follows a list. Prettier otherwise moves the fence into the last list item.
- Reuse a partial for repeated text: `_partials/content-note.qmd`, `_partials/arbeitsauftrag.qmd`, `_partials/kontext-voelkerschauen.qmd`.
- Follow the typography of the deck. `site.scss` styles the website, and `_extensions/oer/` styles the PDFs. Mark a numbered sequence with `::: {.schritte}` and a record excerpt with `::: {.datensatz}`.
- `entwurf: true` in `_quarto.yml` marks every page as a draft. Set `entwurf: false` on a page only after the author review.
- Each section directory sets `kicker` and `zielgruppe` in its `_metadata.yml`. The title block shows them as the kicker line. Do not add audience or draft callouts.
- Link a handbook section only by an anchor that exists on the live handbook.

**Deck.** `slides/folien.qmd` sets `brand: false`. Keep it, so `_brand.yml` does not change the deck. The slide map in `input/slides.qmd` links slide IDs (`folien.html#/<id>`). Update the map when a slide heading changes. `slides/folien.pdf` is committed. Run `npm run slides:pdf` after a deck change.

**Video.** `assets/video/input.mp4` is a lossless cut of the raw recording. `assets/video/README.md` records the command. Never re-encode it. Keep `kapitel.vtt` and the chapter table in `input/video.qmd` in step.

**Printables.** Keep the Typst header rules in the front matter of each printable page. The audit sheet must fit one A4 landscape page.

Define one script that runs the whole gate. Call it, and let `prek` call it too:

```bash
npm run check
```

Add a new tool to that script. A direct `lychee` or `prettier` call drifts from CI. The gate runs no preview and no render. A preview never exits, and a production render belongs in CI.

## 5. GitHub Workflow

Use a fork and a pull request. Never push to upstream.

```bash
gh repo fork OWNER/REPO --clone
git switch -c feat/thing
gh pr create --repo OWNER/REPO
```

Allow maintainer edits. Resync with `gh repo sync`. Put one logical change in one PR. Title the PR with a Conventional Commit.

**Stacked PRs.** Each PR targets the branch below it. The bottom PR targets the trunk. Merge from the bottom up. GitHub retargets the rest. Take the requirements from the trunk only. Use the `gh stack` extension. Keep a stack in one repository, never across forks.

**Trunk protection.** Both layers are idempotent, so a second run converges.

```bash
gh repo edit --enable-squash-merge --enable-merge-commit=false --enable-rebase-merge=false \
  --delete-branch-on-merge --allow-update-branch \
  --enable-secret-scanning --enable-secret-scanning-push-protection
gh api -X PUT repos/OWNER/REPO/branches/main/protection --input protection.json
```

The `PUT` replaces the whole configuration. Take the body shape from the [API reference](https://docs.github.com/en/rest/branches/branch-protection), not from a stale snippet.

For a repository with more than one maintainer, enforce a PR before a merge, at least one approval, dismissal of a stale approval on push, code-owner approval, last-push approval, conversation resolution, strict status checks, linear history, `enforce_admins: true`, no force-push, and no deletion. A solo repository differs. See the bullets below.

- Without `enforce_admins`, the rule is advisory for whoever can bypass it.
- A solo repository needs three settings together: 0 required approvals, no required code-owner review, and no required last-push approval. You cannot approve your own pull request, so either of the last two deadlocks the merge even at 0 approvals.
- The free plan covers branch protection on a public repository. Branch protection on a private repository needs Pro.
- Plan limits differ per feature. Secret scanning, push protection, CodeQL, and dependency review are free on a public repository. On a private repository each one needs a paid GitHub security plan. Check the plan before you enable one in a workflow or in `gh repo edit`.
- Rulesets are the successor at organization scale. `gh ruleset` only reads, and creation uses `POST`, so a second run duplicates the ruleset. Prefer the `PUT` for one repository.

## 6. CI/CD Security

Follow [secure use of Actions](https://docs.github.com/en/actions/reference/security/secure-use).

- Set `permissions: contents: read` at the top level. Widen it per job only where a job needs more.
- Default the repository token to read: `gh api -X PUT repos/OWNER/REPO/actions/permissions/workflow -f default_workflow_permissions=read`.
- Pin an action to a full commit SHA. Verify the SHA against the upstream repository, not a fork. Let Dependabot bump it.
- Never check out fork code under `pull_request_target`. Prefer `workflow_run`, and treat its artifacts as untrusted.
- Never interpolate `github.event.*` into `run:`. Pass the value through `env:` and quote `"$VAR"`.
- Use OIDC and a short-lived cloud role. Do not store a long-lived secret. Keep a secret a scalar, never a JSON blob. Rotate it.
- Gate a deploy on an Environment with required reviewers. Prefer an environment secret over a repository secret.
- Do not use a self-hosted runner on a public repository.
- Cover `.github/workflows/**` in `CODEOWNERS`.
- Require the section 4 gate, CodeQL, and `dependency-review-action`. Run the same gate locally, so CI gives no surprise. On a private repository, confirm the plan covers CodeQL and dependency review first.

## 7. Publishing

The workflow `quarto-publish.yml` deploys the site to GitHub Pages from `main`. Never publish by hand. Never replace the workflow with a manual step.

- Render in CI. A local render hides a missing dependency.
- Keep the Quarto version pinned in `quarto-publish.yml` and `release.yml`. Change both together.
- Give the deploy job the narrowest permission that works. It runs in the `github-pages` Environment.
- Keep the site URL in `_quarto.yml`. An absolute link breaks a preview deployment.
- A published release triggers `release.yml`. It renders the site and attaches `site-<tag>.zip` to the release.
- Zenodo archives each release. `.zenodo.json` holds its metadata. Add the DOI to `CITATION.cff`, `README.md`, and `oer/lizenz.qmd` after the first release.

## Agents CLI Tooling — macOS

This file is an appendix. Append it to a stack specification. Do not use it alone.

Use current stable macOS on Apple Silicon. Use Homebrew for all system tools. A formula puts its binary in `/opt/homebrew/bin`. A cask puts its binary in `/usr/local/bin`. Add both directories to `PATH`. Commit the `Brewfile` and the `Brewfile.lock.json`.

### Brewfile

```ruby
brew "ripgrep"
brew "ripgrep-all"
brew "fd"

brew "rumdl"
brew "lychee"

brew "jq"
brew "yq"
brew "duckdb"

brew "pandoc"
brew "poppler"
brew "qpdf"
cask "quarto"

brew "yt-dlp"
brew "ffmpeg"

brew "node"
brew "uv"
```

- `poppler` gives `pdftotext` and `pdfinfo`.
- `ffmpeg` gives `ffprobe`.
- `rga` calls `pandoc`, `poppler`, and `ffmpeg`. Keep these three formulas.
- `node` is for `pdf-inspector`. `uv` is for Python.

### pdf-inspector

```bash
npm install -g @firecrawl/pdf-inspector
```

The package gives one command, `pdf-inspector`, with a `detect` subcommand. Node runs it.

Do not use `cargo install pdf-inspector`. That build gives `pdf2md` and `detect-pdf`, and it needs a Rust toolchain. The Prohibitions below forbid a toolchain for one CLI.

### Verification

```bash
brew bundle check --verbose

for t in rg rga fd rumdl lychee jq yq duckdb pandoc pdftotext \
         pdfinfo qpdf quarto yt-dlp ffmpeg ffprobe node uv \
         pdf-inspector; do
  command -v "$t" >/dev/null || echo "missing: $t"
done
```

If a tool is missing, stop and report it. Do not use a different tool.

### Tools

| Task                                      | Tool                    |
| ----------------------------------------- | ----------------------- |
| Text search                               | `rg`                    |
| File search                               | `fd`                    |
| Search in PDF, Office, archive, and media | `rga`                   |
| Markdown lint and format                  | `rumdl`                 |
| Markdown structure                        | `pandoc` and `jq`       |
| YAML front matter                         | `yq`                    |
| Link check                                | `lychee`                |
| QMD and document production               | `quarto`                |
| Format conversion                         | `pandoc`                |
| PDF classification and Markdown           | `pdf-inspector`         |
| PDF structure                             | `qpdf`                  |
| PDF text and metadata                     | `pdftotext`, `pdfinfo`  |
| Media inspection                          | `ffprobe`               |
| Media transform                           | `ffmpeg`                |
| Remote media                              | `yt-dlp`                |
| JSON                                      | `jq`                    |
| YAML, XML, and TOML                       | `yq`                    |
| CSV, Parquet, and large JSON              | `duckdb`                |
| SQLite                                    | Python only. See Rules. |

### Commands

```bash
rumdl check .          # Lint. Exit code 1 if violations remain.
rumdl fmt .            # Format. Exit code 0 always.

pandoc README.md -f gfm -t json | jq .

yq --front-matter=extract '.title' doc.md      # Read.
yq --front-matter=process -i '.date = now' doc.md   # Write.

lychee --cache --max-concurrency 8 .

pdf-inspector detect doc.pdf --json
pdf-inspector doc.pdf
pdftotext -layout doc.pdf -
qpdf --check doc.pdf

ffprobe -v error -show_format -show_streams in.mp4

uv run python -c "import sqlite3; print(sqlite3.connect('x.db'))"
```

### Rules

- Read front matter with `extract`. Write it with `process`. `process` prints the full file.
- `yq` gives wrong data if the file has no front matter. Check for `---` on line 1 first.
- Use `yq` for front matter, not `pandoc`. `pandoc` normalizes metadata and cannot write it back.
- Pin `pandoc`. A `jq` filter breaks when the `pandoc-api-version` changes.
- Always use `-layout` with `pdftotext`.
- Use `qpdf` for structure, not for text.
- OCR is not in the baseline. `pdf-inspector detect` returns `TextBased`, `Scanned`, `ImageBased`, or `Mixed`. Read `pagesNeedingOcr` from `--json`. If that list is not empty, stop and report.
- Run `ffprobe` before `ffmpeg`.
- If `yt-dlp` fails to extract, run `brew upgrade yt-dlp` first.
- Run `lychee` in CI only. It is slow and reports false errors for sites that return 403.
- Access SQLite through Python only. Use `uv run`. Do not use the `sqlite3` CLI.
- Pin `rumdl` and `@firecrawl/pdf-inspector`. Both are new. Their interfaces can change.

### Prohibitions

- Do not add a Markdown tool if `pandoc`, `rumdl`, or `yq` can do the task.
- Do not install a compiler toolchain to get one CLI.
- Do not add interactive tools. `fzf`, `bat`, `eza`, `zoxide`, `glow`, and `bottom` are user preferences.
- Do not convert a file if direct inspection is sufficient.

### Principle

```text
search -> inspect -> validate -> extract -> transform
```

For Markdown:

```text
rg -> rumdl -> pandoc + jq -> quarto
```

## Writing Specification — Scientific Prose

This file is an appendix. Append it to a stack specification when the repository holds scientific prose: a paper, a thesis, a report, or a proposal.

Use these rules for scientific and technical writing in English and German. Apply them to argumentative and expository prose. Do not apply them to code, quoted material, or the bibliography.

### Core rules

1. **Use one term for one concept.** Keep technical terminology stable throughout the text.

2. **Guide the reader actively.** State why a step, distinction, method, or argument is introduced before or while introducing it.

3. **Structure arguments as `Context → Content → Conclusion`.** Give the reader the reason for a point, the point itself, and its implication.

4. **Keep comparisons text-immanent.** When explaining X through Y, make the relevant similarity explicit in the text. Prefer comparisons that can be understood without requiring the reader to recall unrelated examples or external contexts.

5. **Keep logically related statements together.** Develop one line of reasoning at a time.

6. **Express one main idea per sentence and one main function per paragraph.**

7. **Prefer direct verbs and simple grammatical structures.** Use active voice when the actor matters. Prefer verbs over nominalizations and short dependency chains over deeply embedded clauses.

8. **Use parallel form for parallel ideas.** Align the structure of comparisons, alternatives, lists, headings, and argument steps.

9. **Make epistemic status visible.** Distinguish what is observed, inferred, assumed, hypothesized, or uncertain.

10. **Make every sentence earn its place.** Use words and transitions to add factual content, logical structure, qualification, or reader guidance.

### Language profiles

**English:** Use clear international scientific English. Prefer direct, literal wording over idiomatic or ornate phrasing.

**Deutsch:** Verwende klares wissenschaftliches Standarddeutsch. Bevorzuge Verben gegenüber Nominalstil und direkte Satzstrukturen gegenüber Schachtelsätzen.

### Priority

When two rules conflict, follow this order: **Precision → Reader guidance → Explicitness → Consistency → Simplicity → Brevity → Elegance**.

In short:

**One concept, one term.  
Explain why before or while explaining what.  
Keep comparisons local and explicit.  
One sentence, one main idea.  
One paragraph, one line of reasoning.**
