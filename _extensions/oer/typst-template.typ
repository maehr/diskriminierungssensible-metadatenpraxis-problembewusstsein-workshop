// Print template for the workshop OER.
// Based on the Quarto 1.10.18 article template. It follows the typography of slides/theme.scss:
// a kicker line in Play, the title in Inter 500, section headings in 600, flat cards.

#let oer-ink = rgb("#24303A")
#let oer-muted = rgb("#5F6B76")
#let oer-faint = rgb("#C9D0D6")
#let oer-pale = rgb("#EEF1F4")
#let oer-accent = rgb("#B58A3A")
#let oer-accent-dark = rgb("#8A6422")
#let oer-accent-tint = rgb("#F6EFE2")

// Callouts become flat cards like on the slides. Important callouts (the Content Note) are warm.
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  let warm = icon_color == rgb("#CC1914")
  block(
    breakable: false,
    width: 100%,
    fill: if warm { oer-accent-tint } else { oer-pale },
    radius: 6pt,
    inset: (x: 12pt, y: 10pt),
    above: 1em,
    below: 1em,
  )[
    #text(size: 0.85em, weight: 600, fill: if warm { oer-accent-dark } else { oer-muted })[#title]
    #if body != [] {
      v(0.25em, weak: true)
      body
    }
  ]
}

#let article(
  title: none,
  subtitle: none,
  kicker: none,
  zielgruppe: none,
  entwurf: false,
  raster: false,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  title-size: 2.1em,
  subtitle-size: 1.3em,
  heading-family: none,
  heading-weight: 500,
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set par(justify: false, leading: linestretch * 0.7em)
  set text(lang: lang, region: region, size: fontsize, fill: oer-ink)
  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none
  set heading(numbering: sectionnumbering)

  // Headings: section titles in 600, like the slide titles.
  show heading: set text(fill: black, weight: 600)
  show heading: set block(above: 1.4em, below: 0.7em)
  show heading.where(level: 2): set text(size: 1.35em)
  show heading.where(level: 3): set text(size: 1.1em)
  show strong: set text(weight: 600)

  // Tables: hairlines, small grey header labels, no justified text in cells.
  // A worksheet (raster: true) gets a full grid, so every cell is a writing box.
  set table(stroke: if raster { 0.5pt + oer-faint } else { (x, y) => (top: if y > 0 { 0.5pt + oer-faint } else { none }, bottom: 0.5pt + oer-faint) })
  show table.cell.where(y: 0): set text(size: 0.85em, weight: 600, fill: oer-muted)
  show table.cell: set par(justify: false)

  show link: set text(fill: oer-accent-dark)
  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none

  if title != none {
    block(width: 100%, below: 1.6em)[
      #if kicker != none or zielgruppe != none or entwurf {
        grid(
          columns: (1fr, auto),
          align: (left + bottom, right + bottom),
          text(font: "Play", weight: 700, size: 1.1em, fill: oer-accent-dark)[#if kicker != none { kicker }],
          text(size: 0.85em, weight: 500, fill: oer-muted)[
            #if entwurf { text(fill: oer-accent-dark)[Entwurf] }
            #if entwurf and zielgruppe != none { h(0.8em) }
            #if zielgruppe != none { zielgruppe }
          ],
        )
        v(0.5em)
      }
      #set par(leading: 0.3em)
      #set text(font: heading-family) if heading-family != none
      #text(size: title-size, weight: heading-weight, fill: black, tracking: -0.015em)[#title]
      #if subtitle != none {
        v(0.35em)
        text(size: subtitle-size, weight: 400, fill: oer-muted)[#subtitle]
      }
      #v(0.6em)
      #line(length: 100%, stroke: 1.5pt + oer-accent)
    ]
  }

  if toc {
    block(above: 0em, below: 2em)[
      #outline(title: toc_title, depth: toc_depth, indent: toc_indent);
    ]
  }

  doc
}

#set table(inset: 6pt, stroke: none)
