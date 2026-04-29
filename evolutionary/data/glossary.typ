// # Glossary. Glossário.

#import "../util.typ": foreign_text

#let abbreviations_entries = (
  (
    key: "abnt",
    short: "ABNT",
    long: "Associação Brasileira de Normas Técnicas",
    group: "Normatização",
  ),
  (
    key: "nbr",
    short: "NBR",
    plural: "NBRs",
    long: "Norma Brasileira",
    longplural: "Normas Brasileiras",
    group: "Normatização",
  ),
)

#let glossary_entries = (
  (
    key: "agint",
    short: "agente inteligente",
    plural: "agentes inteligentes",
    description: [Sistema capaz de interpretar um estado, tomar decisões autônomas e agir para atingir objetivos definidos, aprendendo a adaptar seu comportamento @holmgard:2019:automated_playtesting_procedural_personas
      #footnote[
        #cite(form: "full", <holmgard:2019:automated_playtesting_procedural_personas>)
      ].],
    group: "Computação",
  ),
  (
    key: "selfplay",
    short: foreign_text[self-play],
    custom: [autoaprendizado por simulação de partidas],
    description: [Em português, autoaprendizado por simulação de partidas. Técnica em que um @agint treina jogando contra versões de si mesmo para aprender estratégias por reforço sem dados externos @silver:2017:mastering_chess_shogi
      #footnote[
        #cite(form: "full", <silver:2017:mastering_chess_shogi>)
      ].],
    group: "Computação",
  ),
  (
    key: "jogo",
    short: "jogo",
    plural: "jogos",
    custom: foreign_text[game],
    description: [Em inglês, #foreign_text[game]. Sistema de regras que define objetivos, @jogador:pl, @movimento:pl e condições de vitória ou encerramento @suits:1967:what_is_a_game
      #footnote[
        #cite(form: "full", <suits:1967:what_is_a_game>)
      ].],
    group: "Jogos",
  ),
  (
    key: "jogo_tabuleiro",
    short: "jogo de tabuleiro",
    plural: "jogos de tabuleiro",
    custom: foreign_text[board game],
    description: [Em inglês, #foreign_text[board game]. @Jogo que utiliza um tabuleiro composto por @casa:pl para posicionar peças ou marcadores, onde os @movimento:pl seguem regras espaciais definidas pelo layout do tabuleiro.],
    group: "Jogos",
  ),
  (
    key: "jogo_turno",
    short: "jogo de turnos",
    plural: "jogos de turnos",
    custom: foreign_text[turn-based game],
    description: [Em inglês, #foreign_text[turn-based game]. @Jogo em que os @jogador:pl atuam de forma alternada em @turno:pl sequenciais, fazendo o @estado avançar passo a passo. Neste tipo de @jogo, não são permitidos @movimento:pl simultâneos.],
    group: "Jogos",
  ),
  (
    key: "playtest",
    short: foreign_text[play-test],
    custom: [teste de jogabilidade],
    description: [Em português, teste de jogabilidade. Avaliação prática de um @jogo com participantes para observar a experiência e coletar feedback de melhoria.],
    group: "Jogos",
  ),
  (
    key: "casa",
    short: "casa",
    plural: "casas",
    custom: foreign_text[slot],
    description: [Em inglês, #foreign_text[slot]. Unidade discreta que compõe o tabuleiro e pode conter peças ou recursos.],
    group: "Jogos",
  ),
  (
    key: "estado",
    short: "estado",
    plural: "estados",
    custom: foreign_text[state],
    description: [Em inglês, #foreign_text[state]. Representação completa da situação do @jogo em um instante, incluindo o conteúdo das @casa:pl, os recursos, a @pontuacao dos @jogador:pl e demais condições vigentes.],
    group: "Jogos",
  ),
  (
    key: "pontuacao",
    short: "pontuação",
    plural: "pontuações",
    custom: foreign_text[score],
    description: [Em inglês, #foreign_text[score]. Valor que indica o desempenho de um @jogador segundo as regras do @jogo.],
    group: "Jogos",
  ),
  (
    key: "turno",
    short: "turno",
    plural: "turnos",
    custom: foreign_text[turn],
    description: [Em inglês, #foreign_text[turn]. Período em que um único @jogador realiza seus @movimento:pl antes de passar a vez.],
    group: "Jogos",
  ),
  (
    key: "rodada",
    short: "rodada",
    plural: "rodadas",
    custom: foreign_text[round],
    description: [Em inglês, #foreign_text[round]. Ciclo completo de @turno:pl no qual todos os @jogador:pl têm a oportunidade de agir uma vez.],
    group: "Jogos",
  ),
  (
    key: "partida",
    short: "partida",
    plural: "partidas",
    custom: foreign_text[match],
    description: [Em inglês, #foreign_text[match]. Sessão completa do @jogo, iniciando nas condições iniciais e terminando quando uma condição de fim é atingida.],
    group: "Jogos",
  ),
  (
    key: "movimento",
    short: "movimento",
    plural: "movimentos",
    custom: foreign_text[move],
    description: [Em inglês, #foreign_text[move]. Ação tomada a partir de um @estado que altera as condições atuais, levando a um novo @estado.],
    group: "Jogos",
  ),
  (
    key: "jogador",
    short: "jogador",
    plural: "jogadores",
    custom: foreign_text[player],
    description: [Em inglês, #foreign_text[player]. Participante que toma decisões e executa @movimento:pl conforme as regras do @jogo.],
    group: "Jogos",
  ),
)

#let symbols_entries = ()


#let glossaries_entries = (
  ..abbreviations_entries,
  ..glossary_entries,
  ..symbols_entries,
)
