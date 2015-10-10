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
disciplina(ine5402, 'Programação Orientada a Objetos I', 1).
disciplina(mtm5161, 'Cálculo A', 1).
disciplina(ine5403, 'Matemática Discreta', 1).
disciplina(eel5105, 'Circuitos', 1).
disciplina(ine5401, 'Introdução à computação', 1).

/* Segunda */
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
requisito(ine5421, ine5415).
requisito(ine5418, ine5414).
requisito(ine5418, ine5412).
requisito(ine5422, ine5414).

/* Sexta */
disciplina(ine5427, 'P&GP', 6).
disciplina(ine5453, 'Introdução TCC', 6).
disciplina(ine5425, 'Modelagem e Simulação', 6).
disciplina(ine5430, 'Inteligência Artificial', 6).
disciplina(ine5426, 'Construção de Compiladores', 6).
disciplina(ine5424, 'Sistemas Operacionais II', 6).
requisito(ine5427, ine5419).
requisito(ine5453, ine5419).
requisito(ine5425, ine5405).
requisito(ine5430, ine5405).
requisito(ine5430, ine5416).
requisito(ine5426, ine5421).
requisito(ine5424, ine5412).

/* Setima */
disciplina(ine5433, 'TCC I', 7).
disciplina(ine5432, 'Banco de Dados II', 7).
disciplina(ine5429, 'Segurança Computação', 7).
disciplina(ine5431, 'Sistmas Multimídias', 7).
disciplina(ine5428, 'Informática e Sociedade', 7). 
requisito(ine5433, ine5427).
requisito(ine5433, ine5453).
requisito(ine5432, ine5423).
requisito(ine5429, ine5403).
requisito(ine5429, ine5415).
requisito(ine5429, ine5414).
requisito(ine5431, ine5414).
requisito(ine5428, ine5407).

/* Oitava */ 
disciplina(ine5434, 'TCC II', 8).
requisito(ine5434, ine5433).

/* Teste, deletar dps */
disciplina(ine01, 'INE 01', 9).
disciplina(ine02, 'INE 02', 10).
disciplina(ine10, 'INE 10', 10).
disciplina(ine20, 'INE 20', 10).
disciplina(ine30, 'INE 30', 10).
disciplina(ine40, 'INE 40', 10).
disciplina(ine50, 'INE 50', 10).
disciplina(ine03, 'INE 03', 10).
disciplina(ine04, 'INE 04', 11).
disciplina(ine05, 'INE 05', 11).
disciplina(ine06, 'INE 06', 11).
disciplina(ine07, 'INE 07', 11).
disciplina(ine08, 'INE 08', 11).
disciplina(ine09, 'INE 09', 11).
requisito(ine02, ine01).
requisito(ine03, ine01).
requisito(ine10, ine01).
requisito(ine20, ine01).
requisito(ine30, ine01).
requisito(ine40, ine01).
requisito(ine50, ine01).
requisito(ine04, ine02).
requisito(ine05, ine02).
requisito(ine05, ine03).
requisito(ine06, ine03).
requisito(ine07, ine10).
requisito(ine05, ine20).
requisito(ine09, ine30).
requisito(ine08, ine40).
requisito(ine09, ine50).


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

/* Questão 6 */%aqui mostra em forma de lista, porém na questão 8 mostra o outro.
questao6(X, Y) :- setof(X, P^(disciplina(Y, B, X) , requisito(P, Y)), All).

/* Questão 7 */
questao7(X, Y) :- disciplina(A, B, X) , requisito(A, Y) .

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
showAll(2, Y, Z) :- disciplina(A, Y, 2), recur_disciplinas(A, V), disciplina(V, Z, K).
showAll(X, Y, Z) :- disciplina(A, Y, X), recur_disciplinas(A, V), disciplina(V, Z, K).


/*Challenge*/
recur_disciplinas(X, Y) :- requisito(X, Y).
recur_disciplinas(X, Y) :- requisito(X, Z), recur_disciplinas(Z, Y).