e preciso testar o sistema a ver se crasha com alguma cena,
n testei muito mas testei as cenas individuais e fiz uns runs ate matar tudo ou morrer todos
a usar tudo do inventory e todos os spells etc.  

em principio se tiver bug ou crasha o jogo e nesse caso guardem a mensagem de erro e o q fizeram
ou entao e um problema do tipo ponteiro aponta pra entidade x e açao calha na entidade y

por exemplo estava com um bug em q se o knight verde usasse o primeiro item do inventory
depois na turn seguinte que é a do knight azul, se ele usasse o spell fireball entao o spell
apontava como default para o knight verde em vez do npc no centro. acho q resolvi esse bug mas
n tenho a certeza, pelo menos ja n consigo replicar dpois d implementar uma solucao. 

outra coisa a fazer é experimentar numeros de jogadores e npcs diferentes, ou valores diferentes
nos arrays de entidades (objDataManager)

os comandos do jogo pra ja sao os arrowkeys, up down pra mudar target NPC Player spell inventory item etc
o arrowkeys left right mudam a target do campo dos NPC para o campo dos players durante combate, exemplo
use case: se quiseres mandar uma fireball a um player ou dar spell heal a um npc.

space bar para confirmar açao, ex. usar o spell ou escolher menu INV 
esc para voltar ao menu inicial se por exemplo fores para o menu spells e quiseres voltar atras 

outro bug que corrigi foi usar o esc qnd estava a selecionar o spell nr 3 e dpois se fosse com outro
player o index do spell ainda era o antigo em vez de ser 0. o erro em si era visual pq a unica coisa
q causava era q o menu começava a apontar para x em vez de 0. procurar esse tipo de erros. 