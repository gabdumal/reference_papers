// # Layout configuration. Configuração de leiaute.

#import "style/style.typ": font_family, font_size, neutral_darker_color, theme_color

#let template = it => [
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
      // set text(fill: neutral_darker_color)
      it
    } else {
      set text(fill: theme_color)
      it
    }
  }

  // #show ref: it => {
  //   set text(fill: neutral_darker_color)
  //   it
  // }

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

  #it
]
