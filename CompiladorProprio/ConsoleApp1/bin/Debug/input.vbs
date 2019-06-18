bloco fibonacci(n como numero) como numero
    criar flag como booleano

    flag = falso
    se n = 0 entao
        fibonacci = 1
        flag = verdade
    fim condicao

    se n = 1 entao
        fibonacci = 1
        flag = verdade
    fim condicao

    se flag = falso entao
        fibonacci = fibonacci(n-2) + fibonacci(n-1)
    fim condicao
fim bloco

codigo main()
    mostre_me fibonacci(5)
fim codigo