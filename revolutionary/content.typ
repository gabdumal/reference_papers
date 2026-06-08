#import "components.typ": cite_prose, note_from_gabriel, stress, todo_note
#import "packages.typ": glossarium
#import "util.typ": foreign_text, get_term

== Apresentação

- #cite_prose(<silver:2016:mastering_game_go>)#footnote[
    #cite(form: "full", <silver:2016:mastering_game_go>)
  ] é uma pesquisa do laboratório *Google Deepmind*.

#grid(
  columns: (1fr, 1fr),
  [
    - Publicada na revista #stress[Nature] em *2016*.
      - Fator de impacto de *48,5* (2024).
    - #stress[13509] citações.
      - Percentil *99* de atenção.
  ],
  align(start)[
    - Impacto dos *autores* principais (desde 2021):
      - David Silver: h-index de #stress[89]\;
      - Aja Huang: h-index de #stress[13]\;
      - Chris J. Maddison: h-index de #stress[31].
  ],
)


== Paradigma

#grid(
  columns: (1fr, 1fr),
  [
    Paradigma #stress[atual]:
    - métodos de @ia clássicos para simular @jogador:pl;
      - Arvores de *busca*;
    - simulação cresce em espaço e em *tempo* para @jogo:pl complexos;
      - exaustão impossível para o @jogo Go.
  ],
  align(start)[
    Paradigma #stress[revolucionário]:
    - baseia-se em *@agint:pl*
      - jogam Go como profissionais;
      - estruturados em *@rn:pl*;
      - aprendizado por reforço;
    - caráter estocástico;
    - política de busca *orientada*, e não poda.
  ],
)


== Hipótese

- Hipótese #stress[não] é explicitamente *definida*.
  - Introdução discorre sobre problemática e trabalhos relacionados.

- Deduz-se da #stress[problemática]:
  - *Go* é intratável por algoritmos clássicos --- muitos *@movimento:pl* possíveis. // Nenhum conseguiu vencer um humano profissional até então.
  - Deseja-se simular @jogador:pl de Go em tempo viável.

- #stress[Hipótese]:
  - *Conhecimento* necessário para aprender Go pode ser *extraído* de massa de dados --- não de estratégias prévias.
  - #stress[Simulação] requer métodos de *busca*, mas adaptados por
    - *aprendizado* supervisionado e por reforço.

- Trabalho foca no *desenvolvimento* e teste da *solução* proposta.


== Sistemas

#stress[@Jogo] é um "#stress[sistema] de *regras* que define objetivos, @jogador:pl, @movimento:pl e condições de vitória ou encerramento" @suits:1967:what_is_a_game#footnote[
  #cite(form: "full", <suits:1967:what_is_a_game>)
].

- *Correlaciona* elementos representados.
  - #stress[inicia] uma @partida --- gera o @estado inicial;
  - #stress[executa] um *@movimento* --- leva de um @estado a outro;
  - #stress[verifica] se a @partida chegou ao *fim*; e
  - #stress[calcula] a *pontuação* dos @jogador:pl.

- Estratégias #stress[emergem] das *dinâmicas* durante as simulações e o aprendizado.
  - Desnecessário conhecimento prévio além das regras.


== Domínio

#stress[Classes] de jogos.
- #stress[Contínuos]: tempo passa como no mundo *real* --- simulado em frames.
- #glossarium.gls("jogo_turno", plural: true, display: stress[Turnos]): tempo passa de forma *discreta* --- sequência de @estado:pl.

#stress[Domínio]:
- Apenas #stress[@jogo_turno:pl].
  - Cada *jogada* é representada como um *@turno*
    - salvo no *histórico* --- árvore de busca.
- #stress[Determinismo]: cada *@movimento* leva a um único novo *@estado*.
- Informação #stress[completa] --- visível a todos os @jogador:pl.
  - Perfeitamente serializável.
  - Avaliada por função de qualidade objetiva.


== Situação de contorno

Existem fatores de *limitação* do #stress[escopo]
- Poderiam ser superados em trabalhos futuros.

Restrito a #glossarium.gls("jogo_tabuleiro", plural: true, display: stress(glossarium.gls-plural("jogo_tabuleiro"))).
- @Estado deve ser uma #stress[matriz] de #glossarium.gls("casa", plural: true, display: strong(glossarium.gls-plural("casa"))) --- como uma *imagem*
- @Jogo:pl de cartas poderiam funcionar com adaptações.

@Partida:pl entre #stress[dois #glossarium.gls("jogador", plural: true, display: stress(glossarium.gls-plural("jogador")))].
- A árvore de *busca* alterna os níveis entre cada @jogador.
- Existem trabalhos que a adaptam para múltiplos jogadores.


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
