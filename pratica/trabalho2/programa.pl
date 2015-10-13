/* Emmanuel Podestá Junior, Fernando Paladini, Lucas Ribeiro Neis.

   Programacao Logica - Prof. Alexandre G. Silva - 30set2015
   
   RECOMENDACOES:
   
   - O nome deste arquivo deve ser 'programa.pl'
   
   - O nome do banco de dados deve ser 'desenhos.pl'
   
   - Dicas de uso podem ser obtidas na execucação: 
     ?- menu.
     
   - Exemplo de uso:
     ?- load.
     ?- searchAll(id1).
     
   - [Done] change. Done and ready for test.
      * [Done] returning "false", I think it should return "true" instead (more friendly)
      * [Done] When we got two or more identifiers (id40, id50 and so on), this method changes
        the correct point, but "deletes" all points from different identifiers.

        How to reproduce:
          xy(id40, 0, 250).
          xy(id40, 10, 10).
          xy(id50, 30, 30).
          xy(id50, 0, -2).
          xy(id50, 40, 78).
          xy(id60, 10000, 10000).

        Then change some identifier calling change(id50, 0, -2, 10000, 10000).

   - [Not a problem] changeFirst. Done and ready for test.
      * Not changing only the first when points with same value appears:
            xy(id40, 0, 250).
            xy(id40, 0, 250).

        This will change both values. Actually don't know if it is a real problem.
        Anyway, can be easily solved just picking up the first point and ignoring others.

   - [Done] changeLast. Done and ready for test.
      * [Done] Couldn't test because the following error:
          ?- changeLast(id50, 200, 20004).
          ERROR: lUltimo/2: Undefined procedure: l/2
          Exception: (9) l([[id50, 0, -200]], _G566) ? 

   - searchFirst. Done and ready for test.
      * Okay.

   - searchLast. Done and ready for test.
      * Okay.

   - undo.

   - remove. Done and ready for test.
      * Okay.

   - quadrado. Done and ready for test.
      * Okay.

   - figura. Done and ready for test.
      * Okay.
      
   - replica.
   - Colocar o nome e matricula de cada integrante do grupo
     nestes comentarios iniciais do programa. Done.
*/
remove(Id, X, Y) :-
    retract(xy(Id, X, Y)).

% undo :- 
%     copy('desenhos.pl','backup.pl') :- 
%     open('desenhos.pl',read,Stream1),
%     open('backup.pl',write,Stream2),
%     copy_stream_data('desenhos.pl','backup.pl'),
%     close(File1),
%     close(File2).

undo:-
  list(A, B, C),
  retract(list(A,B,C)),
  retract(xy(A,B,C)), !.

% Apaga os predicados 'xy' da memoria e carrega os desenhos a partir de um arquivo de banco de dados
load :-
    retractall(xy(_,_,_)),
    open('desenhos.pl', read, Stream),
    repeat,
        read(Stream, Data),
        (Data == end_of_file -> true ; assert(Data), fail),
        !,
        close(Stream).

% Ponto de deslocamento, se <Id> existente
new(Id,X,Y) :-
    xy(Id,_,_),
    assertz(xy(Id,X,Y)),
    asserta(list(Id,X,Y)),
    !.

% Ponto inicial, caso contrario
new(Id,X,Y) :-
    asserta(xy(Id,X,Y)),
    asserta(list(Id,X,Y)),
    !.

quadrado(Id, X, Y, Lado) :-
    new(Id, X, Y),
    new(Id, Lado, 0),
    nb_setval(lado, Lado),
    nb_getval(lado, New),
    Neg is New * -1,
    new(Id, 0, Lado),
    new(Id, Neg, 0).

replicaTeste(Id, N, Dx, Dy) :-
    findall(Ponto, (xy(Id,X,Y), append([Id], [X], L1), append(L1, [Y], Ponto) ), All), length(All, T),
    between(0, T, K),
    nth0(K, All, V),
    nth0(0, V, Ident),
    nth0(1, V, Ex),
    nth0(2, V, Uai),
    atom_concat(Ident, N, NewIdent),
    NewEx is Ex+(Dx*N),
    NewUai is Uai+(Dy*N),
    ((K =:= 0) -> new(NewIdent, NewEx, NewUai) ; new(NewIdent, Ex, Uai)),
    false.

replica(Id,N,Dx,Dy) :-
    between(1, N, M),
    replicaTeste(Id, M, Dx, Dy),
    false.

figura(Id, X, Y, Lado) :-
    nb_setval(lado, Lado),
    nb_getval(lado, New),
    Neg is New * -1,
    NegU is Neg / sqrt(2),
    LadoU is New / sqrt(2),
    new(Id, X, Y),
    new(Id, LadoU, NegU),
    new(Id, Lado, 0),
    new(Id, LadoU, LadoU),
    new(Id, 0, Lado),
    new(Id, NegU, LadoU),
    new(Id, Neg, 0),
    new(Id, NegU, NegU).

% Exibe opcoes de busca
search :-
    write('searchAll(Id).     -> Ponto inicial e todos os deslocamentos de <Id>'), nl,
    write('searchFirst(Id,N). -> Ponto inicial e os <N-1> primeiros deslocamentos de <Id>'), nl,
    write('searchLast(Id,N).  -> Lista os <N> ultimos deslocamentos de <Id>').

searchAll(Id) :-
    listing(xy(Id,_,_)).

searchFirst(Id, N) :-
    findall(Ponto, (xy(Id,X,Y), append([Id], [X], L1), append(L1, [Y], Ponto) ), All),
    nth0(0, All, M),
    write(M), nl,
    between(1, N, X),
    nth0(X, All, K),
    write(K), nl,
    false.

searchLast(Id, N) :-
    findall(Ponto, (xy(Id,X,Y), append([Id], [X], L1), append(L1, [Y], Ponto) ), All), length(All, Tam),
    Itera is Tam - N,
    between(Itera, Tam, X),
    nth0(X, All, K),
    write(K),
    false.

% Exibe opcoes de alteracao
change :-
    write('change(Id,X,Y,Xnew,Ynew).  -> Altera o ponto inicial de <Id>'), nl,
    write('changeFirst(Id,Xnew,Ynew). -> Altera o ponto inicial de <Id>'), nl,
    write('changeLast(Id,Xnew,Ynew).  -> Altera o deslocamento final de <Id>').

change(Id, X, Y, Xnew, Ynew) :-
    (findall(Ponto, (xy(Z,U,W), append([Z], [U], L1), append(L1, [W], Ponto) ), All), length(All, T),
    retractall(xy(_,_,_)),
    between(0, T, K),
    nth0(K, All, V),
    nth0(0, V, Ident),
    nth0(1, V, Ex),
    nth0(2, V, Uai),
    ( Ident = Id, Ex = X, Uai = Y -> new(Ident, Xnew, Ynew);
    new(Ident, Ex, Uai)), false);
    true.

changeFirst(Id, Xnew, Ynew) :-
    remove(Id, _, _), !,
    asserta(xy(Id, Xnew, Ynew)).

changeLast(Id, Xnew, Ynew) :-
      findall(Ponto, (xy(Id,X,Y), append([Id], [X], L1), append(L1, [Y], Ponto) ), All), length(All, T),
      lUltimo(All, L),
      write(L),
      nth0(0, L, Ident),
      write(Ident),
      nth0(1, L, Ex),
      nth0(2, L, Uai),
      remove(Ident,Ex, Uai),
      assertz(xy(Id, Xnew, Ynew)).

% ler o ultimo, 
lUltimo([X], X).
lUltimo([H|T], L) :- lUltimo(T, L).
%ler todos
lAll([X], X, K).
lAll([H|T], L, K) :- lAll(T, L, K), H = K.
% Grava os desenhos da memoria em arquivo
commit :-
    open('desenhos.pl', write, Stream),
    telling(Screen),
    tell(Stream),
    listing(xy),
    %% listing(list),
    tell(Screen),
    close(Stream).

% Exibe menu principal
menu :-
    write('load.        -> Carrega todos os desenhos do banco de dados para a memoria'), nl,
    write('new(Id,X,Y). -> Insere um deslocamento no desenho com identificador <Id>'), nl,
    write('                (se primeira insercao, trata-se de um ponto inicial)'), nl,
    write('search.      -> Consulta pontos dos desenhos'), nl,
    write('change.      -> Modifica um deslocamento existente do desenho'), nl,
    write('remove.      -> Remove um determinado deslocamento existente do desenho'), nl,
    write('undo.        -> Remove o deslocamento inserido mais recentemente'), nl,
    write('commit.      -> Grava alteracoes de todos dos desenhos no banco de dados').