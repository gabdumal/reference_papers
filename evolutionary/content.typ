#import "components.typ": cite_prose, note_from_gabriel, stress, todo_note
#import "packages.typ": glossarium
#import "util.typ": foreign_text, get_term

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

O artigo trata sobretudo de #stress[#glossarium.gls-plural("jogo")], que são tidos como os
- *objetos fundamentais* para se aplicar qualquer técnica de
  - busca de *soluções* para @partida:pl.

Já os #stress[#glossarium.gls-plural("agint")] são tidos como os
- *objetos resultantes* da tecnologia desenvolvida.
- Sobre eles, são realizados experimentos, e se coleta
  - dados analíticos sobre o *desempenho* de solução.

Sobre @jogo:pl, destacam-se como *fenômenos* as #stress[#glossarium.gls-plural("partida")].
- São por meio delas que um @jogo parte do *@estado inicial*
  - e chega ao *final* com vitória, derrota ou empate.
- Os @agint:pl visam a *reproduzir*
  - o *decorrer* de uma @partida que um @jogador profissional faria.


= Conjuntos

Um @jogo_turno requer que sejam determinados *conjuntos* de #stress[componentes].
- Uma #glossarium.gls("partida", display: stress(glossarium.gls-short("partida"))) é um conjunto de *@rodada:pl*, partindo da inicial até um @estado terminal.
- Uma #glossarium.gls("rodada", display: stress(glossarium.gls-short("rodada"))) é um conjunto de *@turno:pl* alternados entre *@jogador:pl*.
- Um #glossarium.gls("estado", display: stress(glossarium.gls-short("estado"))) representa o conjunto de *@casa:pl* do tabuleiro de forma organizada.

O AlphaZero também requer que sejam determinados de antemão:
- o *conjunto* de todas as #glossarium.gls("casa", plural: true, display: stress(glossarium.gls-plural("casa"))) do tabuleiro e os valores que podem assumir.
- o *conjunto* de todos os #glossarium.gls("movimento", plural: true, display: stress(glossarium.gls-plural("movimento"))) que podem ser tomados em qualquer @estado;
- o *conjunto* de todos os #glossarium.gls("jogador", plural: true, display: stress(glossarium.gls-plural("jogador"))) que participarão de dada @partida.


= Sistemas

O significante #stress[@jogo] é definido como: "#stress[sistema] de *regras* que define objetivos, @jogador:pl, @movimento:pl e condições de vitória ou *encerramento*" @suits:1967:what_is_a_game#footnote[
  #cite(form: "full", <suits:1967:what_is_a_game>)
].

Computacionalmente, um @jogo pode ser representado como uma *classe* que recebe como atributos os #stress[conjuntos] de @casa:pl, @movimento:pl, e @jogador:pl.
- Essa classe provê *métodos* para:
  - #stress[inicializar] a @partida, gerando o @estado inicial;
  - #stress[executar] um *@movimento*, levando de um @estado a outro; e
  - #stress[verificar] se a @partida chegou ao *fim*; e
  - #stress[calcular] a *pontuação* dos @jogador:pl.
- Assim, ela correlaciona todos os elementos representados.


= Domínio

#stress[Nem todos] os @jogo:pl são computacionalmente *equiparáveis*!
Existem os:
- #glossarium.gls("jogo_turno", plural: true, display: stress(glossarium.gls-plural("jogo_turno"))), em que o *tempo* passa de forma *discreta*, por meio de @turno:pl;
- #stress[jogos de tempo contínuo], em que o tempo passa como no *mundo real*
  - quando representados computacionalmente, o decorrer do @jogo é feito por meio de *#get_term("frame", plural: true)* de simulação e renderização.

O artigo de referência estabelece como #stress[domínio] apenas os *@jogo_turno:pl*.
- Cada *jogada* é representada como um @turno,
- que é representado como um *nó* de uma *árvore* de busca.
- Cada *@movimento* leva a um novo *@estado*.
- A informação dos @estado:pl deve ser *completa*, visível a todos os @jogador:pl.

É #stress[impossível] utilizar os métodos de busca em árvore em @jogo:pl contínuos.


= Situação de contorno

Os autores determinaram alguns fatores de *limitação* do #stress[escopo] do trabalho.

Apenas é possível *aplicar* a técnica desenvolvida para #glossarium.gls("jogo_tabuleiro", plural: true, display: stress(glossarium.gls-plural("jogo_tabuleiro"))).
- A modelagem dos *@estado:pl* requer que eles sejam
  - formados por uma #stress[matriz de #glossarium.gls("casa", plural: true, display: stress(glossarium.gls-plural("casa")))], como uma *imagem*,
  - domínio em que as @cnn:pl operam.

A técnica também abordou apenas @partida:pl entre #stress[dois #glossarium.gls("jogador", plural: true, display: stress(glossarium.gls-plural("jogador")))].
- O método de *@mcts* alterna os níveis da *árvore de busca* entre cada @jogador.

Apesar de a técnica almejar ser #stress[genérica], dadas as situações de contorno, os autores fizeram experimentações *apenas com os jogos* Go, Xadrez e Shogi.


= Abstração

No contexto do artigo discutido, um #stress[@jogo] é tido como um objeto de características limitadas.
#stress[Não] são levados em #stress[consideração] aspectos como:
- diversão dos @jogador:pl e caráter lúdico;
- desenho artístico e desenvolvimento de tema; ou
- material físico e manipulação de objetos no mundo real.

Isso destaca a #stress[abstração] realizada, ao considerar apenas
- os aspectos do @jogo que interessam à *modelagem computacional* e que
- possibilitam analisar a #stress[complexidade] de
  - *dinâmicas* (ou estratégias) emergentes durante as @partida:pl.


= Reducionismo

Durante o processo de #glossarium.gls("selfplay", display: stress(glossarium.gls-short("selfplay"))), uma série de @partida:pl são *simuladas* por @agint:pl em níveis progressivos de treinamento.
- Ao chegar ao @estado de fim de @jogo, a *@pontuacao* é registrada.

O algoritmo #stress[reduz] cada *@turno* a:
- o @estado do tabuleiro prévio;
- o @movimento jogado; e
- a @pontuacao do respectivo @jogador.

Essa estrutura é usada para #stress[ajustar] os *@peso:pl e @vies:pl* do modelo parcial durante o treinamento em aprendizado por reforço.


= Experimento

Os autores utilizaram a técnica *AlphaZero* para #stress[gerar e treinar] independentemente três @agint:pl.

Compararam seus #stress[desempenhos] em @partida:pl contra outros *algoritmos* de referência, considerando uma grande quantidade de execuções.
- Xadrez: comparação com o Stockfish.
- Shogi: comparação com o Elmo.
- Go: comparação com o AlphaGo (artigo revolucionário).

A natureza aleatória do AlphaZero levou a uma diversidade de dinâmicas observadas.

Aferiu-se *vantagem significativa* do AlphaZero na quantidade de vitórias.
- A quantidade de buscas em árvore foi bastante inferior àquela dos concorrentes.
- Foram identificadas estratégias de abertura de @partida:pl similares àquelas desenvolvidas por humanos.


= Reprodutibilidade
