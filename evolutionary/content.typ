#import "components.typ": cite_prose
#import "packages.typ": glossarium
#import "util.typ": foreign_text

= Paradigma

O artigo em discussão @silver:2018:general_reinforcement_learning_algorithm
#footnote[
  #cite(
    form: "full",
    <silver:2018:general_reinforcement_learning_algorithm>,
  )
]
evolui uma tecnologia de *#glossarium.gls-custom("selfplay")* (*@selfplay*) para os @jogo_tabuleiro:pl Go, Xadrez e Shogi.

Esse desenvolvimento surge dentro da transição entre *paradigmas*, cuja transformação se deu pela publicação do artigo revolucionário de
#cite_prose(<silver:2016:mastering_game_go>)
#footnote[
  #cite(form: "full", <silver:2016:mastering_game_go>)
].

Ambos os artigos fazem parte de uma *pesquisa contínua* realizada pelo laboratório de pesquisa em @ia #foreign_text[Google DeepMind].

O paradigma dado pelo artigo *revolucionário*
indica que:
- é possível usar @rn:pl para
- gerar *@agint:pl* que
- joguem Go melhor que
  - quaisquer algoritmos naquele estado-da-arte.

A técnica usa dois passos de treinamento:
- aprendizado *supervisionado* com base em históricos de @partida:pl de profissionais;
- aprendizado por *reforço* com base em @selfplay, em que
  - a função de gratificação usa o *paradigma clássico* de
    - @mcts.
