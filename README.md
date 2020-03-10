# README

Estes documento README tem como objetivo fornecer as informaÃ§Ãµes necessÃ¡rias para realizaÃ§Ã£o do projeto Empresas.

### O QUE FAZER ?

- VocÃª deve realizar um fork deste repositÃ³rio e, ao finalizar, enviar o link do seu repositÃ³rio para a nossa equipe. Lembre-se, NÃƒO Ã© necessÃ¡rio criar um Pull Request para isso, nÃ³s iremos avaliar e retornar por email o resultado do seu teste.

### ESCOPO DO PROJETO

- Deve ser criada uma API em **NodeJS** ou **Ruby on Rails**.
- A API deve fazer o seguinte:

1. Login e acesso de UsuÃ¡rio jÃ¡ registrado;
2. Para o login usamos padrÃµes **JWT** ou **OAuth 2.0**;
3. Listagem de Empresas
4. Detalhamento de Empresas
5. Filtro de Empresas por nome e tipo

### InformaÃ§Ãµes Importantes

- A API deve funcionar exatamente da mesma forma que a disponibilizada na collection do postman, mais abaixo os acessos a API estarÃ£o disponÃ­veis em nosso servidor.

  - Para o login usamos padrÃµes OAuth 2.0. Na resposta de sucesso do login a api retornarÃ¡ 3 custom headers (access-token, client, uid);

  - Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisiÃ§Ã£o;

- Mantenha a mesma estrutura do postman em sua API, ou seja, ela deve ter os mesmo atributos, respostas, rotas e tratamentos, funcionando igual ao nosso exemplo.

- Quando seu cÃ³digo for finalizado e disponibilizado para validarmos, vamos subir em nosso servidor e realizar a integraÃ§Ã£o com o app.

- Independente de onde conseguiu chegar no teste Ã© importante disponibilizar seu fonte para analisarmos.

- Ã‰ obrigatÃ³rio utilizaÃ§Ã£o de Banco de Dados MySql/PostgreSQL

### Dados para Teste

- Servidor: https://empresas.ioasys.com.br/
- VersÃ£o da API: v1
- UsuÃ¡rio de Teste: testeapple@ioasys.com.br
- Senha de Teste : 12341234

### Dicas

- DocumentaÃ§Ã£o JWT https://jwt.io/
- Frameworks NodeJS:

  1. https://expressjs.com/pt-br/
  2. https://sailsjs.com/

- Guideline rails http://guides.rubyonrails.org/index.html
- Componente de autenticaÃ§Ã£o https://github.com/lynndylanhurley/devise_token_auth
