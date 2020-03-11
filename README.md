# README

Estes documento README tem como objetivo fornecer as informações necessárias para realização do projeto Empresas.

### O QUE FAZER ?

- Vocẽ deve realizar um fork deste repositório e, ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, não é necessário criar um Pull Request para isso, não iremos avaliar e retornar por email o resultado do seu teste.

### ESCOPO DO PROJETO

- Deve ser criada uma API em **NodeJS** ou **Ruby on Rails**.
- A API deve fazer o seguinte:

1. Login e acesso de Usuário registrado;
2. Para o login usamos padrões **JWT** ou **OAuth 2.0**;
3. Listagem de Empresas
4. Detalhamento de Empresas
5. Filtro de Empresas por nome e tipo

### Informações Importantes

- A API deve funcionar exatamente da mesma forma que a disponibilizada na collection do postman, mais abaixo os acessos a API estarão disponíveis em nosso servidor.

  - Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);

  - Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;

- Mantenha a mesma estrutura do postman em sua API, ou seja, ela deve ter os mesmo atributos, respostas, rotas e tratamentos, funcionando igual ao nosso exemplo.

- Quando seu código for finalizado e disponibilizado para validarmos, vamos subir em nosso servidor e realizar a integração com o app.

- Independente de onde conseguiu chegar no teste é importante disponibilizar seu fonte para analisarmos.

- É obrigatório utilização de Banco de Dados MySql/PostgreSQL

### Como iniciar o projeto

- Ambiente testado unix
- É necessário ter a versão do **Ruby 2.6.5 e Rails 5.2** para o projeto, dica utilizar rvm para isto
- Duplicar o arquivo **config/database.yml.example** e renomear para **config/database.yml**
- Configurar o arquivo citado acima de acordo com a conexão do seu banco de dados postgres
- Executar o comando `gem install bundler` para ter o gerenciador de pacotes
- Executar o comando `bundle install` para ter as bibliotecas instaladas
- Executar o comando `rails db:drop db:create db:migrate db:seed db:test:prepare` para que os dados de desenvolvimento e testes estejam configurados
- Executar o comando `rails s` para iniciar o servidor
- Rodar testes com o script do postman localizado em **spec/support/App_Empresas.postman_collection**

### Como testar o projeto localmente

Este projeto tem a cobertura acima de 60% dos possíveis cenários. Os casos adversos são para obter testes não impactáveis mas posteriormente seria interessante um upgrade nos mesmos.

Pra obter estes números é necessário apenas executar `rspec spec` na pasta do projeto. Porém com a biblioteca `Guard` pode-se também executar os testes com `bundle exec guard` e com qualquer alteração no projeto os testes relevantes são rodados novamente.

### Dados para Teste

- Servidor: https://empresas.ioasys.com.br/
- Versão da API: v1
- Usuário de Teste: testeapple@ioasys.com.br
- Senha de Teste : 12341234

### Dicas

- Documentação JWT https://jwt.io/
- Frameworks NodeJS:

  1. https://expressjs.com/pt-br/
  2. https://sailsjs.com/

- Guideline rails http://guides.rubyonrails.org/index.html
- Componente de autenticação https://github.com/lynndylanhurley/devise_token_auth
