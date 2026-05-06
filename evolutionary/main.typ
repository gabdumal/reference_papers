#import "packages.typ": glossarium, quati-abnt, touying

#import "components.typ": slide, title_page

#import "data/data.typ" as data
#import "data/glossary.typ": glossaries_entries

#import "style/style.typ": font_size, neutral_darkest_color, neutral_lightest_color, theme_color

#import "template.typ": template


// ## Glossary. Glossário.
#show: glossarium.make-glossary
#glossarium.register-glossary(glossaries_entries)


// ## Template. Modelo.
#show: template
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
  touying.config-common(
    show-strong-with-alert: false,
  ),
)


// ## Pages. Páginas.

#title_page()

#include "content.typ"


// ## Glossary. Glossário.
// = Glossário
// #slide(title: "Glossário")[
#glossarium.print-glossary(
  disable-back-references: true,
  glossaries_entries,
  invisible: true,
)
// ]


// ## Bibliography. Bibliografia.
= Referências
#slide(title: "Referências")[
  #bibliography("data/bibliography.bib")
]
