#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

@login_happy
    Cenario: Acesso
        Quando eu faço login como "t@t.com" e "123456"
        Então devo ser autenticado
        E devo ver "Tony Stark" na área logada

    Cenario: Senha inválida
        Quando eu faço login como "t@t.com" e "abc123456"
        Então não devo ser autenticado
        E devo ver a mensagem "usuário e/ou senha inválidos"

    Cenario: Usuário inválido
        Quando eu faço login como "abc@aabc.com" e "abc123456"
        Então não devo ser autenticado
        E devo ver a mensagem "usuário e/ou senha inválidos"

    Cenario: Usuário não informado
        Quando eu faço login como "" e "abc123456"
        Então não devo ser autenticado
        E devo ver a mensagem "Opps. Cadê o email?"

    Cenario: Senha não informada
        Quando eu faço login como "abc@aabc.com" e ""
        Então não devo ser autenticado
        E devo ver a mensagem "Opps. Cadê a senha?"