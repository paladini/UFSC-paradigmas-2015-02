/* Questão 8  
questao8(X, Y) :- 
	disciplina(A, B, X), 
	disciplina(C, D, X), 
	not(A = C),
	requisito(A, G), 
	requisito(C, G),

	disciplina(E, F, H), not(E = A), not(E = C),
	requisito(Y, A);
	requisito(Y, C).*/


questao8(X, Y) :-
	disciplina(A, B, X),
	disciplina(C, D, X),
	not(C = A),
	requisito(A, W),
	requisito(C, W),

	disciplina(E,F,H), not(E = A), not(E = C),
	(requisito(E,A); requisito(E,C)),
	(disciplina(A,Y,X) ; disciplina(C,Y,X)).