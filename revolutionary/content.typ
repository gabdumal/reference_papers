#import "components.typ": cite_prose, note_from_gabriel, stress, todo_note
#import "packages.typ": glossarium
#import "util.typ": foreign_text, get_term

== Apresentação

- Pesquisa do laboratório *Google Deepmind*.
  - @Jogador:pl artificiais de Go por aprendizado por reforço.
- Publicada na revista #stress[Nature] em *2016*.
  - Fator de impacto de *48,5* (2024).
- #stress[13509] citações.
  - Percentil *99* de atenção.

- Impacto dos *autores* principais (desde 2021):
  - David Silver: h-index de #stress[89]\;
  - Aja Huang: h-index de #stress[13]\;
  - Chris J. Maddison: h-index de #stress[31].

== Paradigma

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

Ambos os artigos fazem parte de uma #stress[pesquisa contínua] realizada pelo laboratório de *@ia* #foreign_text[Google DeepMind].

O #stress[paradigma] dado pelo artigo *revolucionário* (AlphaGo)
indica que:
- é possível usar @rn:pl para
- gerar *@agint:pl* que
- joguem #stress[Go] (e nenhum outro jogo) melhor que
  - @jogador:pl profissionais e algoritmos no estado-da-arte.

O método revolucionário usava dois passos de *treinamento*:
- aprendizado #stress[supervisionado] com base em históricos de @partida:pl de profissionais;
- aprendizado por #stress[reforço] com base em @selfplay, em que
  - a função de gratificação usa o *paradigma clássico* de
    - @mcts.


== Hipótese

Os autores acreditam que é possível *consolidar* o paradigma em #stress[crise].

Nesse cenário, eles declaram como hipótese que:
- é possível gerar *@agint:pl* #stress[genéricos] que
- joguem *quaisquer* @jogo_tabuleiro:pl dentro do escopo estabelecido
- com desempenho #stress[superior] a algoritmos no estado-da-arte
- #stress[sem] necessitar de otimizações ou conhecimento #stress[específicos] de cada jogo.

Para comprová-la, os autores:
- desenvolvem a tecnologia #stress[AlphaZero],
- aplicam-na aos jogos Go, Xadrez e Shogi, e
- comparam o desempenho de seus @agint:pl a
  - demais algoritmos de @jogador:pl artificiais de *referência*.


== Aproximações sucessivas

Como ferramenta para validar a hipótese, os autores partem da tecnologia *anterior* (AlphaGo) para a *evolucionária* (AlphaZero).

Algumas limitações do *AlphaGo* eram:
- usa *conhecimento específico* do jogo Go:
  - seu tabuleiro é #stress[simétrico] --- jogadas são equivalentes em qualquer rotação ---,
    - o que acelera o treinamento de máquina;
- usa *aprendizado* #stress[supervisionado].

Os autores agora fazem #stress[aproximações sucessivas]. No AlphaZero,
- o treinamento *não pode* (e não precisa de) depender de simetrias ou otimizações;
- utiliza apenas *aprendizado* #stress[por reforço]
  - simula @partida:pl por meio de @selfplay, o que
    - cria uma massa de dados para ajustar os @peso:pl e @vies:pl.


== Objetos e fenômenos

O artigo trata sobretudo de #stress[#glossarium.gls-plural("jogo")], que são tidos como os
- *objetos fundamentais* para se aplicar qualquer método de
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


== Conjuntos

Um @jogo_turno requer que sejam determinados *conjuntos* de #stress[componentes].
- Uma #glossarium.gls("partida", display: stress(glossarium.gls-short("partida"))) é um conjunto de *@rodada:pl*, partindo da inicial até um @estado terminal.
- Uma #glossarium.gls("rodada", display: stress(glossarium.gls-short("rodada"))) é um conjunto de *@turno:pl* alternados entre *@jogador:pl*.
- Um #glossarium.gls("estado", display: stress(glossarium.gls-short("estado"))) representa o conjunto de *@casa:pl* do tabuleiro de forma organizada.

O AlphaZero também requer que sejam determinados de antemão:
- o *conjunto* de todas as #glossarium.gls("casa", plural: true, display: stress(glossarium.gls-plural("casa"))) do tabuleiro e os valores que podem assumir.
- o *conjunto* de todos os #glossarium.gls("movimento", plural: true, display: stress(glossarium.gls-plural("movimento"))) que podem ser tomados em qualquer @estado;
- o *conjunto* de todos os #glossarium.gls("jogador", plural: true, display: stress(glossarium.gls-plural("jogador"))) que participarão de dada @partida.


== Sistemas

O significante #stress[@jogo] é definido como: "#stress[sistema] de *regras* que define objetivos, @jogador:pl, @movimento:pl e condições de vitória ou *encerramento*" @suits:1967:what_is_a_game#footnote[
  #cite(form: "full", <suits:1967:what_is_a_game>)
].

Computacionalmente, um @jogo pode ser representado como uma *classe* que recebe como atributos os #stress[conjuntos] de @casa:pl, @movimento:pl, e @jogador:pl.
- Essa classe provê *métodos* para:
  - #stress[inicializar] a @partida, gerando o @estado inicial;
  - #stress[executar] um *@movimento*, levando de um @estado a outro; e
  - #stress[verificar] se a @partida chegou ao *fim*; e
  - #stress[calcular] a *pontuação* dos @jogador:pl.

O @jogo é o sistema que *correlaciona* todos os elementos representados.


== Domínio

#stress[Nem todos] os @jogo:pl são computacionalmente *equiparáveis*!
- Nos #glossarium.gls("jogo_turno", plural: true, display: stress(glossarium.gls-plural("jogo_turno"))), o tempo passa de forma *discreta*;
- Nos #stress[jogos contínuos], o tempo passa  em *#get_term("frame", plural: true)* de simulação e renderização.

O artigo de referência estabelece como #stress[domínio] apenas os *@jogo_turno:pl*.
- Cada *jogada* é representada como um @turno,
- que é salvo como um *nó* de uma *árvore* de busca.
- Cada *@movimento* leva a um novo *@estado*.
- A informação dos @estado:pl deve ser *completa*, visível a todos os @jogador:pl.

É #stress[impossível] utilizar os métodos de busca em árvore em @jogo:pl contínuos.


== Situação de contorno

Existem fatores de *limitação* do #stress[escopo]
- Poderiam ser superados em trabalhos futuros.

Apenas é possível *aplicar* o método para #glossarium.gls("jogo_tabuleiro", plural: true, display: stress(glossarium.gls-plural("jogo_tabuleiro"))).
- A modelagem dos *@estado:pl* requer que sejam
  - formados por uma #stress[matriz de #glossarium.gls("casa", plural: true, display: stress(glossarium.gls-plural("casa")))], como uma *imagem*, que é
    - domínio em que as @cnn:pl operam.

O método abordou apenas @partida:pl entre #stress[dois #glossarium.gls("jogador", plural: true, display: stress(glossarium.gls-plural("jogador")))].
- A *@mcts* alterna os níveis da *árvore de busca* entre cada @jogador.

#stress[Crítica:] apesar de o método almejar ser #stress[genérico] (dadas as situações de contorno) os autores fizeram experimentações *apenas com os jogos* Go, Xadrez e Shogi.


== Abstração

No contexto do artigo, um #stress[@jogo] é tido como um objeto de características *limitadas*.

#stress[Não] são levados em *consideração* aspectos como:
- diversão dos @jogador:pl e caráter lúdico;
- desenho artístico e desenvolvimento de tema; ou
- material físico e manipulação de objetos no mundo real.

Isso destaca a #stress[abstração] realizada, ao considerar apenas
- os aspectos do @jogo que interessam à *modelagem computacional* e que
- possibilitam analisar a #stress[complexidade] de
  - *dinâmicas* (ou estratégias) emergentes durante as @partida:pl.


== Reducionismo

Durante o processo de #glossarium.gls("selfplay", display: stress(glossarium.gls-short("selfplay"))), uma série de @partida:pl são *simuladas* por @agint:pl em níveis progressivos de treinamento.
- Ao chegar ao @estado de fim de @jogo, a *@pontuacao* é registrada.

O algoritmo #stress[reduz] cada *@turno* a:
- o *@estado* do tabuleiro prévio;
- o *@movimento* jogado; e
- a *@pontuacao* obtida pelo respectivo @jogador.

Essa estrutura é usada para #stress[ajustar] os *@peso:pl e @vies:pl* do modelo parcial durante o treinamento em aprendizado por reforço.


== Experimento

Os autores utilizaram o método *AlphaZero* para #stress[gerar e treinar] @agint:pl.
- registraram a relação *tempo* de treinamento #sym.times *desempenho*.

#stress[Executaram] um grande número de *@partida:pl* entre um @agint e o algoritmo de referência.
- *Xadrez*: comparação com o *Stockfish*.
- *Shogi*: comparação com o *Elmo*.
- *Go*: comparação com o *AlphaGo* (artigo revolucionário).

Os pesquisadores registraram
- a quantidade de #stress[vitórias], derrotas e empates.
  - *vantagem significativa* do AlphaZero;
- quantidade de #stress[buscas] em árvore
  - *bastante inferior* no AlphaZero;
- #stress[estratégias] de abertura de @partida:pl
  - AlphaZero se comporta *similarmente* a humanos.


== Reprodutibilidade

Os autores buscaram garantir a #stress[reprodutibilidade] da seguinte forma.
- Descreveram a *arquitetura da @cnn* utilizada.
- Explicaram o processo de busca da *@mcts adaptada* e sua saída.
- Determinaram a função de *avaliação da @pontuacao* final das @partida:pl.
- Disponibilizaram o *pseudo-código* do algoritmo de @selfplay e de treinamento.
- Listaram os *hiper-parâmetros*.
- Descreveram os *recursos* computacionais.
- Apresentaram o *passo-a-passo* das @partida:pl executadas do experimento.

#colbreak()

#stress[Crítica:] Alguns pontos poderiam ser #stress[melhorados].

- Disponibilizar o *código completo*
  - da representação das regras dos @jogo:pl,
  - do ambiente de execução do experimento, e
  - da construção da estrutura da @cnn.

- Para os modelos utilizados no experimento,
  - fornecer o *código* e os *@peso:pl* e vieses.

- Fornecer o conjunto de *#foreign_text[seeds]* para controlar a aleatoriedade.
