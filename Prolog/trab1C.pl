/* Emmanuel Podestá Junior, Fernando Paladini, Lucas Ribeiro Neis */
fase(1).
fase(2).
fase(3).
fase(4).
fase(5).
fase(6).
fase(7).
fase(8).

/* Primeira */
listaDisciplinas(1, [ine5402, mtm5161, ine5403, eel5105, ine5401]).
disciplina(ine5402, 'Programação Orientada a Objetos I', 1).
disciplina(mtm5161, 'Cálculo A', 1).
disciplina(ine5403, 'Matemática Discreta', 1).
disciplina(eel5105, 'Circuitos', 1).
disciplina(ine5401, 'Introdução à computação', 1).

/* Segunda */
listaDisciplinas(2, [ine5404, mtm7174, ine5405, mtm5512, ine5406, ine5407]).
disciplina(ine5404, 'Programação Orientada a Objetos II', 2).
disciplina(mtm7174, 'Cálculo B', 2).
disciplina(ine5405, 'Probabilidade e Estatística', 2).
disciplina(mtm5512, 'Geometria Analítica', 2).
disciplina(ine5406, 'Sistemas Digitais', 2).
disciplina(ine5407, 'Ciência, Tecnologia e Sociedade', 2).
requisito(ine5404, ine5402).
requisito(mtm7174, mtm5161).
requisito(ine5405, mtm5161).
requisito(ine5406, eel5105).

/* Terceira */
listaDisciplinas(3, [ine5408, ine5410, ine5409, mtm5245, ine5411]).
disciplina(ine5408, 'Estruturas de Dados', 3).
disciplina(ine5410, 'Programação Concorrente', 3).
disciplina(ine5409, 'Cálculo Numérico', 3).
disciplina(mtm5245, 'Álgebra Linear', 3).
disciplina(ine5411, 'Organização de Computadores', 3).
requisito(ine5408, ine5404).
requisito(ine5410, ine5404).
requisito(ine5409, mtm7174).
requisito(ine5409, mtm5512).
requisito(mtm5245, mtm5512).
requisito(ine5411, ine5406).

/* Quarta */
listaDisciplinas(4, [ine5417, ine5413, ine5415, ine5416, ine5412, ine5414]).
disciplina(ine5417, 'Engenharia de Software I', 4).
disciplina(ine5413, 'Grafos', 4).
disciplina(ine5415, 'Teoria da Computação', 4).
disciplina(ine5416, 'Paradigmas de Programação', 4).
disciplina(ine5412, 'Sistemas Operacionais I', 4).
disciplina(ine5414, 'Redes I', 4).
requisito(ine5417, ine5408).
requisito(ine5413, ine5408).
requisito(ine5413, ine5403).
requisito(ine5415, ine5403).
requisito(ine5415, ine5408).
requisito(ine5416, ine5408).
requisito(ine5412, ine5410).
requisito(ine5412, ine5411).
requisito(ine5414, ine5404).

/* Quinta */
listaDisciplinas(5, [ine5419, ine5423, ine5420, ine5421, ine5418, ine5422]).
disciplina(ine5419, 'Engenharia de Software II', 5).
disciplina(ine5423, 'Bando de Dados I', 5).
disciplina(ine5420, 'Computação Gráfica', 5).
disciplina(ine5421, 'Linguagens Formais', 5).
disciplina(ine5418, 'Computação Distribuída', 5).
disciplina(ine5422, 'Redes II', 5).
requisito(ine5419, ine5417).
requisito(ine5423, ine5408).
requisito(ine5420, mtm7174).
requisito(ine5420, mtm5245).
requisito(ine5420, ine5408).
requisito(ine5421, ine5415).
requisito(ine5418, ine5414).
requisito(ine5418, ine5412).
requisito(ine5422, ine5414).

/* Sexta */
listaDisciplinas(6, [ine5427, ine5453, ine5425, ine5430, ine5426, ine5424]).
disciplina(ine5427, 'P&GP', 6).
disciplina(ine5453, 'Introdução TCC', 6).
disciplina(ine5425, 'Modelagem e Simulação', 6).
disciplina(ine5430, 'Inteligência Artificial', 6).
disciplina(ine5426, 'Construção de Compiladores', 6).
disciplina(ine5424, 'Sistemas Operacionais II', 6).
requisito(ine5427, ine5417).
requisito(ine5453, ine5417).
requisito(ine5425, ine5405).
requisito(ine5430, ine5405).
requisito(ine5430, ine5416).
requisito(ine5430, ine5413).
requisito(ine5426, ine5421).
requisito(ine5424, ine5412).

/* Setima */
listaDisciplinas(7, [ine5433, ine5432, ine5429, ine5431, ine5428]).
disciplina(ine5433, 'TCC I', 7).
disciplina(ine5432, 'Banco de Dados II', 7).
disciplina(ine5429, 'Segurança Computação', 7).
disciplina(ine5431, 'Sistmas Multimídias', 7).
disciplina(ine5428, 'Informática e Sociedade', 7). 
requisito(ine5433, ine5427).
requisito(ine5433, ine5453).
requisito(ine5432, ine5423).
requisito(ine5429, ine5403).
requisito(ine5429, ine5414).
requisito(ine5431, ine5414).
requisito(ine5428, ine5407).

/* Oitava */ 
listaDisciplinas(8, [ine5434]).
disciplina(ine5434, 'TCC II', 8).
requisito(ine5434, ine5433).



/*Parte B*/

/* Questão 1 */ 
fase(X, Y) :- disciplina(X, _, Y).

/* Questão 2 */
nome(X, Y) :- disciplina(X, Y, Z).

/* Questão 3 */
disciplinasDaFase(X, Y) :- disciplina(A, Y, X).

/* Questão 4 */
dependenciaEmComum(X, Y) :- requisito(X, Z) , requisito(Y, Z), not(X = Y).

/* Questão 5 */
dependencia_de_dependencia(X, Y) :- requisito(X, Z), requisito(Z, Y). 

/* Questão 6 */
questao6(X, Y) :- setof(X, P^(disciplina(Y, B, X) , requisito(P, Y)), All).

/* Questão 7 */
questao7(X, Y) :- disciplina(A, Y, X) , requisito(A, Z) .

/* Questão 8 */
questao8(X, Y, Z) :- 
setof(Z, Dist^(P^(
	disciplina(Y, A, X),
  	requisito(Y, W),
  	requisito(Z, W),
  	not(Y = Z),
  	requisito(Dist, Y),
  	requisito(P, Z))), All)
	.

/* Questão 9 */
questao9(X, Y, Z) :- 
	disciplina(X, B, W),
	requisito(X, Y),
	requisito(Y, Z).

/* Questão 10 - Mostrar o nome de todas as disciplinas de uma fase e seus requisitos */
showAll(1, Y, _) :- disciplina(_, Y, 1).
showAll(2, Y, _) :- disciplina(_, Y, 2).
showAll(X, Y, Z) :- disciplina(A, Y, X), recur_disciplinas(A, V), disciplina(V, Z, K).

/*Challenge*/
recur_disciplinas(X, Y) :- requisito(X, Y).
recur_disciplinas(X, Y) :- requisito(X, Z), recur_disciplinas(Z, Y).




/*Parte C*/



/*Questão1*/
questao1C(X, Y) :- listaDisciplinas(X, Z), length(Z, Y).





/*Questão2*/

count([ ]) :- add(0), nb_getval(total, CounterValue), write(CounterValue).
count([X|L1]) :- length(X, Y), add(Y) ,count(L1).
questao2C :- setof(Z, Dist^(listaDisciplinas(Dist, Z)), All), nb_setval(total, 0), count(All).
add(Y) :- nb_getval(total, C), CNew is C + Y, nb_setval(total, CNew).




/*Questão 3*/
questao3C(Y) :- setof(Z, Dist^(requisito(Z, Dist)), All), length(All, Y).




/*Questão 4*/

questao4C(Y) :- setof(Z, Dist^(requisito(Dist, Z)), All), length(All, Y).




/*Questão 5 - Simples e Encadeada*/
questao5CSimples(X, Y) :- setof(Z, (requisito(X, Z)), All), write(All), length(All, Y).
questao5CEnc(X, Y) :- setof(Z, (recur_disciplinas(X, Z)), All), length(All, Y).



/*Questão 6 - Simples e Encadeada*/
questao6CSimples(Y) :- findall(Z, questao5CSimples(H, Z), QntReq), max(QntReq, K), questao5CSimples(Y, K).
questao6CEnc(Y) :- findall(Z, questao5CEnc(H, Z), QntReq), max(QntReq, K), questao5CEnc(Y, K).


max([R], R).
max([X|Xs], R):- max(Xs, T), (X > T -> R = X ; R = T).



/*Questão 7 - Simples e Encadeada*/
questao7CSimples(X, Y) :- setof(Z, (requisito(Z, X)), All), length(All, Y).

questao7CEnc(X, Y) :- setof(Z, (recur_disciplinas(Z, X)), All), length(All, Y), write(All).




/*Questão 8 - Pre-requisitos Encadeados*/
questao8C(Y) :- findall(Z, qntPosReqDisciplina(_, Z), All), max(All, K), qntPosReqDisciplina(Y, K). %Chamada inicial
qntPosReqDisciplina(X, Y) :- setof(Z, recur_posDisciplinas(X, Z), All), length(All, Y).

recur_posDisciplinas(X, Y) :- requisito(Y, X).
recur_posDisciplinas(X, Y) :- requisito(Y, Z), recur_posDisciplinas(X, Z).




/*Questão 9 - Encadeada*/
seq(X,[]) :- \+requisito(X,_).
seq(X,[Y|L]) :- requisito(X,Y), seq(Y,L).

questao9C(Y) :- findall(Z, (questao5CEnc(_, Z)), All), max(All, M), questao5CEnc(Y, M).





/*Questão 10 - Disciplina com o maior número de pre-requisitos dado uma lista de disciplinas.*/

questao10C([H|G]) :- nb_setval(total, 0), !, determinarQnt([H|G]), nb_getval(total, C), verificarLista([H|G], C). %Chamada inicial

determinarQnt([]) :- !.
determinarQnt([H|G]) :- nb_getval(total, C), (requisito(H, _) -> questao5CEnc(H, Y),(C < Y -> nb_setval(total, Y), determinarQnt(G); determinarQnt(G));
determinarQnt(G)).

verificarLista([], Z) :- !.
verificarLista([H|G], Z) :- questao5CEnc(H, K), (K = Z -> Y = K, verificarLista(G, Z), write_ln(H) ; verificarLista(G, Z)).
