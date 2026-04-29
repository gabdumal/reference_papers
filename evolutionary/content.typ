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

O paradigma dado pelo artigo *revolucionário* (AlphaGo)
indica que:
- é possível usar @rn:pl para
- gerar *@agint:pl* que
- joguem *Go* (e nenhum outro jogo) melhor que
  - jogadores profissionais e quaisquer algoritmos no estado-da-arte.

A técnica usa dois passos de treinamento:
- aprendizado *supervisionado* com base em históricos de @partida:pl de profissionais;
- aprendizado por *reforço* com base em @selfplay, em que
  - a função de gratificação usa o *paradigma clássico* de
    - @mcts.


= Hipótese

Os autores acreditam que é possível aprimorar o estado-da-arte por *aproximações sucessivas* e consolidar o paradigma em crise.

Nesse cenário, eles declaram como hipótese que:
- é possível gerar @agint:pl *genéricos* que
- joguem quaisquer @jogo_tabuleiro:pl dentro do escopo estabelecido
- com desempenho *superior* a algoritmos no estado-da-arte
- *sem* necessitar de otimizações ou conhecimento *específicos* de cada jogo.

Para comprová-la, os autores:
- desenvolvem a tecnologia *AlphaZero*,
- aplicam-na aos jogos Go, Xadrez e Shogi, e
- comparam o desempenho de seus @agint:pl a demais algoritmos de *referência* que auto-jogam os respectivos jogos.
