:- dynamic produtos/4.                  /*Criar BANCO - 'produtos'*/

main :-
    nl,
    write('CONTROLE DE ESTOQUE'),nl,nl,
    write('1 - Cadastrar produtos'),nl,
    write('2 - Pesquisar produtos'),nl,
    write('3 - Apagar produto'),nl,
    write('4 - Sair'),nl,
    write('Digite a opção: '),
    read(CAT),                                        /*Lê CAT = Categoria*/
    opcao(CAT).

/*   INICIO   -   CATEGORIAS       */

%1
opcao(CAT) :-
    CAT==1,
    write('Codigo do produto: '), nl,
    read(W),
    write('Nome do produto: '), nl,                   /*Cadastra produto*/
    read(X),
    write('Marca do produto: '),   nl,
    read(Y),
    write('Quantidade: '), nl,
    read(Z),
    buscar(W,X,Y,Z).

%2
opcao(CAT) :-
        CAT==2,
        nl,write('Pesquisar por:')  ,nl,nl,
        write('1 - Codigo do produto'),nl,           /* Menu pesquisar */
        write('2 - Nome do produto'),nl,
        write('Digite a opção: '),
        read(P),
        pesquisar_p(P).

%3
opcao(CAT) :-                          /* Apagar produto */
        CAT==3,
        write('Digite o codigo do produto: '),
        read(W),
        del(W).

%4
opcao(CAT) :-                          /* Sair do menu */
        CAT==4.

/*   FIM   -   CATEGORIAS       */

%Invalida
opcao(_) :-
        nl,write('OPÇÃO INVALIDA'),nl,
        main.

buscar(W,X,Y,Z) :-
    asserta(produtos(W,X,Y,Z)),                   /*Auxilia cadastro*/
    write('CADASTRADO'),nl,
    main.

del(W) :-
    produtos(W,X,Y,Z),
    retract(produtos(W,X,Y,Z)),nl,
    write('PRODUTO APAGADO!'),nl,
    main.


/*   INICIO   -   Comandos de PESQUISAR no banco       */

pesquisar_p(P) :-
        P == 1,
        pesquisar_cc.

pesquisar_p(P) :-
        P == 2,
        pesquisar_n.

pesquisar_p(_) :-
        nl,write('OPÇÃO INVALIDA'),nl,
        main.

pesquisar_cc :-
        write("Digite o codigo: "),
        read(W),
        pesquisar_c(W).

pesquisar_c(W) :-
        produtos(W,X,Y,Z),nl,
        write('Codigo':W),nl,
        write('Nome':X),nl,
        write('Marca':Y),nl,
        write('Quantidade':Z),nl,nl,
        main.

pesquisar_c(_):-
        	nl,write('PRODUTO NAO EXISTE!'),nl,
        	main.

pesquisar_n :-
        write("Digite o nome do produto: "),
        read(X),
        pesquisar_nn(X).

pesquisar_nn(X) :-
        produtos(W,X,Y,Z),nl,
        write('Codigo':W),nl,
        write('Nome':X),nl,
        write('Marca':Y),nl,
        write('Quantidade':Z),nl,nl,
        main.

pesquisar_nn(_):-
      	nl,write('PRODUTO NAO EXISTE!'),nl,
      	main.

/*   FIM   -   Comandos de PESQUISAR no banco       */
