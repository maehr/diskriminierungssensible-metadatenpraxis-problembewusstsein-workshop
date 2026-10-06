# TODO

Open steps after the first implementation. Remove an item when it is done.

## Review

- [ ] Review every page. Set `entwurf: false` in its front matter after the review, or remove `entwurf: true` from `_quarto.yml` when all pages are done.
- [ ] Check the facts on the five case cards against the linked records.
- [ ] Check the slide map in `input/slides.qmd`: which slides belong to 60, 75/90 minutes, and self-study.
- [ ] Check the didactic recommendations that `SPECS.md` does not fix: group size (3–5), time signals, plenary format, the case-card suggestions per GLAM sector.
- [ ] Confirm the code-of-conduct reporting address in `CODE_OF_CONDUCT.md`.

## Content

- [ ] Confirm the licence of the video (assumed: CC BY-SA 4.0, like the OER).
- [ ] Add captions (WebVTT) to the video for accessibility.
- [ ] Optional: archive the video on Zenodo and link the DOI on `input/video.qmd`.

## GitHub and Zenodo (maintainer)

- [x] Create the repository `maehr/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop` and push `main`.
- [x] Settings → Pages → Source: GitHub Actions.
- [x] Default the workflow token to read.
- [x] Enable secret scanning, push protection, Dependabot alerts, and Dependabot security updates.
- [x] Protect `main` (solo profile: pull request with 0 approvals, required checks, linear history, no force-push, also for admins).
- [ ] After the merge of `feat/workshop-oer`: remove the branch from `on.push.branches` in `.github/workflows/quarto-publish.yml` and from the `github-pages` deployment branch policy (`gh api -X DELETE repos/maehr/diskriminierungssensible-metadatenpraxis-problembewusstsein-workshop/environments/github-pages/deployment-branch-policies/<id>`).
- [ ] Connect the repository to Zenodo. Publish release `v0.1.0`. Add the DOI to `CITATION.cff`, `README.md`, and `oer/lizenz.qmd`.
- [ ] Generate `CHANGELOG.md` with `npm run changelog` after the first release.
