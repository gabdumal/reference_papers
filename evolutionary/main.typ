#import "packages.typ": glossarium, quati-abnt, touying

#import "components.typ": slide, title_page

#import "data/data.typ" as data
#import "data/glossary.typ": glossaries_entries

#import "style/style.typ": (
  font_family, font_size, neutral_darker_color, neutral_darkest_color, neutral_lightest_color, theme_color,
)

// ## Layout configuration. Configuração de leiaute.

#set text(
  lang: "pt",
  region: "br",
  hyphenate: true,
  weight: "regular",
  font: font_family,
)

#set grid(
  align: (left, right),
  gutter: font_size,
)

#show link: it => {
  if type(it.dest) == label {
    text(fill: neutral_darker_color, it)
  } else {
    text(fill: theme_color, it)
  }
}

#show ref: it => {
  text(fill: neutral_darker_color, it)
}

// ## Glossary. Glossário.
#show: glossarium.make-glossary
#glossarium.register-glossary(glossaries_entries)

// ### Bibliography. Referências.
// NBR 6023:2025 6, NBR 14724:2024 4.2.3.1
#set bibliography(
  style: "./style/bibliography_style.csl",
  title: none,
)
#show bibliography: body => {
  set par(
    leading: font_size * 0.5,
    spacing: font_size,
  )
  set block(
    breakable: false,
  )
  body
}


// ## Template. Modelo.
#show: touying.themes.metropolis.metropolis-theme.with(
  aspect-ratio: "16-9",
  header-right: image(
    height: 1cm,
    "./assets/images/logomarca_ufjf_fundo_escuro.png",
  ),
  touying.themes.metropolis.config-colors(
    primary: theme_color,
    primary-light: rgb("#BEBEBE"),
    secondary: rgb("#565656"),
    neutral-lightest: neutral_lightest_color,
    neutral-darkest: neutral_darkest_color,
  ),
)


// ## Pages. Páginas.

#title_page()

#include "content.typ"


// ## Glossary. Glossário.
= Glossário
#slide(title: "Glossário")[
  #glossarium.print-glossary(
    disable-back-references: true,
    glossaries_entries,
  )
]

// ## Bibliography. Bibliografia.
= Referências
#slide(title: "Referências")[
  #bibliography("data/bibliography.bib")
]
