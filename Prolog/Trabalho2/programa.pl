/*
   Programacao Logica - Prof. Alexandre G. Silva - 30set2015
   
   RECOMENDACOES:
   
   - O nome deste arquivo deve ser 'programa.pl'
   
   - O nome do banco de dados deve ser 'desenhos.pl'
   
   - Dicas de uso podem ser obtidas na execucação: 
     ?- menu.
     
   - Exemplo de uso:
     ?- load.
     ?- searchAll(id1).
     
   - change Done and ready for test.
   - changeFirst
   - changeLast
   - searchFirst
   - searchLast
   - undo
   - remove Done and ready for test.
   - quadrado Done and ready for test.

   - Colocar o nome e matricula de cada integrante do grupo
     nestes comentarios iniciais do programa
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
    !.

% Ponto inicial, caso contrario
new(Id,X,Y) :-
    asserta(xy(Id,X,Y)),
    !.

quadrado(Id, X, Y, Lado) :-
    new(Id, X, Y),
    new(Id, Lado, 0),
    nb_setval(lado, Lado),
    nb_getval(lado, New),
    Neg is New * -1,
    new(Id, 0, Neg),
    new(Id, Neg, 0).


% Exibe opcoes de busca
search :-
    write('searchAll(Id).     -> Ponto inicial e todos os deslocamentos de <Id>'), nl,
    write('searchFirst(Id,N). -> Ponto inicial e os <N-1> primeiros deslocamentos de <Id>'), nl,
    write('searchLast(Id,N).  -> Lista os <N> ultimos deslocamentos de <Id>').

searchAll(Id) :-
    listing(xy(Id,_,_)).

searchFirst(Id, N) :-
%    findall(Dots, (xy(X,Y,Z), X = Id), All),
%    write(All),
%    between(1, N, X),
%    write(X),
%    false.
    clause(xy(Id, X, Y), Body).

%loop(N) :-
%        between(1, N, X),
%        writeln(X),
%        false.

%solutions(_, N) :-
%  solution(Q, N),
%  (cache(Qs) -> retractall(cache(_)) ; Qs = []),
%  assert(cache([Q|Qs])),
%  fail.

%solutions(Qs, _) :-
%  retract(cache(Qs)).

%solutions(Q):-
%    Q = [X, Y, S],
%    between(2,50,X),
%    between(2,50,Y),
%    S is X+Y,
%    Y > X,
%    S =< 50.

% Exibe opcoes de alteracao
change :-
    write('change(Id,X,Y,Xnew,Ynew).  -> Altera o ponto inicial de <Id>'), nl,
    write('changeFirst(Id,Xnew,Ynew). -> Altera o ponto inicial de <Id>'), nl,
    write('changeLast(Id,Xnew,Ynew).  -> Altera o deslocamento final de <Id>').

change(Id, X, Y, Xnew, Ynew) :-
    remove(Id, X, Y),
    new(Id, Xnew, Ynew).
% Grava os desenhos da memoria em arquivo
commit :-
    open('desenhos.pl', write, Stream),
    telling(Screen),
    tell(Stream),
    listing(xy),
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
