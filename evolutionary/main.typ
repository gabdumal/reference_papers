#import "packages.typ": glossarium, touying

#import "components.typ": title_page

#import "data/data.typ" as data
#import "data/glossary.typ": glossaries_entries

#import "style.typ": font_family, font_size, neutral_color, theme_color

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

#show link: set text(fill: theme_color)

// ## Glossary. Glossário.
#show: glossarium.make-glossary
#glossarium.register-glossary(glossaries_entries)


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
    neutral-lightest: neutral_color,
    neutral-dark: rgb("#565656"),
    neutral-darkest: rgb("#565656"),
  ),
)

// ## Pages. Páginas.

#title_page()

#include "content.typ"


// ## Bibliography. Bibliografia.
#show bibliography: none
#bibliography(title: none, style: "chicago-notes", "./data/bibliography.bib")
