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

/* Regras */ 
nome(X, Y) :- disciplina(X, Y, Z).
fase(X, Y) :- disciplina(X, Z, Y).
temDependencia(X) :- requisito(X, Y).
