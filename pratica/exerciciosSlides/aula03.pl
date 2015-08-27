homem(alberto).
homem(eduardo).
mulher(alice).
mulher(vitoria).
pais(eduardo, vitoria, alberto).
pais(alice, vitoria, alberto).

% Regras %
diff(X,Y) :- not(X = Y).
irma_de(X,Y) :- mulher(X), pais(X,M,P), pais(Y,M,P), diff(X,Y).
