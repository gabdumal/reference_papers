#import "components.typ": cite_prose, note_from_gabriel, stress, todo_note
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
evolui uma tecnologia de #stress(glossarium.gls-custom("selfplay")) (*@selfplay*) para os @jogo_tabuleiro:pl Go, Xadrez e Shogi.

Esse desenvolvimento surge dentro da transição entre #stress[paradigmas], cuja transformação se deu pela publicação do artigo revolucionário de
#cite_prose(<silver:2016:mastering_game_go>)
#footnote[
  #cite(form: "full", <silver:2016:mastering_game_go>)
].

Ambos os artigos fazem parte de uma #stress[pesquisa contínua] realizada pelo laboratório de pesquisa em *@ia* #foreign_text[Google DeepMind].

O #stress[paradigma] dado pelo artigo *revolucionário* (AlphaGo)
indica que:
- é possível usar @rn:pl para
- gerar *@agint:pl* que
- joguem #stress[Go] (e nenhum outro jogo) melhor que
  - @jogador:pl profissionais e quaisquer algoritmos no estado-da-arte.

A técnica usa dois passos de *treinamento*:
- aprendizado #stress[supervisionado] com base em históricos de @partida:pl de profissionais;
- aprendizado por #stress[reforço] com base em @selfplay, em que
  - a função de gratificação usa o *paradigma clássico* de
    - @mcts.


= Hipótese

Os autores acreditam que é possível consolidar o paradigma em crise.

Nesse cenário, eles declaram como hipótese que:
- é possível gerar *@agint:pl* #stress[genéricos] que
- joguem *quaisquer* @jogo_tabuleiro:pl dentro do escopo estabelecido
- com desempenho #stress[superior] a algoritmos no estado-da-arte
- #stress[sem] necessitar de otimizações ou conhecimento #stress[específicos] de cada jogo.

Para comprová-la, os autores:
- desenvolvem a tecnologia #stress[AlphaZero],
- aplicam-na aos jogos Go, Xadrez e Shogi, e
- comparam o desempenho de seus @agint:pl a demais algoritmos de *referência* que auto-jogam os respectivos jogos.


= Aproximações sucessivas

Como ferramenta para validar a hipótese, os autores partem da tecnologia *anterior* (AlphaGo) para a *evolucionária* (AlphaZero).

Algumas limitações do *AlphaGo* eram:
- usa *conhecimento específico* do jogo Go:
  - o tabuleiro do Go é #stress[simétrico], tanto faz qual é a rotação,
    - o que acelera o treinamento de máquina;
- usa *aprendizado* #stress[supervisionado].

Os criadores do *AlphaZero* fazem #stress[aproximações sucessivas]:
- o treinamento *não pode* (e não precisa de) depender de simetrias ou otimizações;
- utiliza apenas *aprendizado* #stress[por reforço]
  - simula @partida:pl por meio de @selfplay, o que
    - cria uma massa de dados para ajustar os @peso:pl e @vies:pl.

= Objetos e fenômenos

jogos
agentes inteligentes


= Abstração

No contexto do artigo discutido, um #stress[@jogo] é tido como um objeto de características limitadas.
#stress[Não] são levados em #stress[consideração] aspectos como:
- diversão dos @jogador:pl e caráter lúdico;
- desenho artístico e desenvolvimento de tema; ou
- material físico e manipulação de objetos no mundo real.

Os autores utilizam o significante #stress[@jogo] como:
- #stress[sistema] de *regras* que define objetivos, @jogador:pl, @movimento:pl e condições de vitória ou #stress[encerramento] @suits:1967:what_is_a_game#footnote[
    #cite(form: "full", <suits:1967:what_is_a_game>)
  ].

Isso destaca a #stress[abstração] realizada, ao considerar apenas os aspectos do @jogo que interessam à *modelagem computacional* de seus componentes e que possibilitam analisar a #stress[complexidade] de dinâmicas emergentes durante as @partida:pl.

= Conjuntos e sistemas

componentes de um jogo

= Reducionismo

Reduz as partidas a um conjunto de turnos; usa apenas tuplas (turno, resultado) para treinar o modelo

= Experimento

= Reprodutibilidade

= Domínio

Jogos de turnos

= Situação de contorno

Jogos de dois jogadores; jogos de tabuleiro; Go, Xadrez e Shogi
