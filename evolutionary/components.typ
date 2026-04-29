// # Components. Componentes.

#import "./data/data.typ" as data

#import "./packages.typ": (
  quati-abnt.common.components.cite_prose, quati-abnt.common.components.closed_discussion_note,
  quati-abnt.common.components.create_status_note, quati-abnt.common.components.done_note,
  quati-abnt.common.components.editor_note, quati-abnt.common.components.open_discussion_note,
  quati-abnt.common.components.progress_note, quati-abnt.common.components.todo_note, touying,
  touying.themes.metropolis.empty-slide, touying.themes.metropolis.focus-slide, touying.themes.metropolis.slide,
)

#import "style/style.typ": font_size, neutral_lightest_color, theme_color


#let print_person(
  person: (
    first_name: "Fulano",
    middle_name: none,
    last_name: "Fonseca",
    curriculum: [E-mail: #link("mailto:fulano@email.com").],
  ),
) = context {
  person.first_name
  if person.middle_name != none {
    sym.space + person.middle_name
  }
  sym.space
  person.last_name
  footnote(
    numbering: "*",
    person.curriculum,
  )
}

#let print_people(
  people: (),
  joiner: sym.comma + sym.space,
) = {
  (
    people
      .map(person => print_person(
        person: person,
      ))
      .join(
        joiner,
      )
  )
}

#let title_page = () => empty-slide(
  config: (touying.config-page(fill: neutral_lightest_color)),
)[
  #grid(
    columns: (auto, auto),
    [
      #{
        set text(font_size + 1pt)
        text(weight: "bold", data.title) + linebreak()
        data.subtitle
        block(
          inset: (
            top: -font_size * 0.5,
            bottom: -font_size * 0.3,
          ),
          line(
            length: 240pt,
            stroke: theme_color + 2pt,
          ),
        )
      }

      #{
        set text(fill: theme_color)
        print_people(people: data.authors)
      }

      #{
        set text(font_size - 1pt)
        data.institution + linebreak()
        data.organization + linebreak()
        text(
          weight: "bold",
          datetime(
            day: 07,
            month: 05,
            year: 2026,
          ).display("[day]/[month]/[year]"),
        )
      }
    ],

    stack(
      spacing: font_size,
      image(
        height: 4cm,
        "./assets/images/brasao_ufjf.png",
      ),
      image(
        height: 4cm,
        "./assets/images/logomarca_ppgcc.png",
      ),
    ),
  )
]
