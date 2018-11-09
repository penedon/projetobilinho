# Solução: Projeto Bilinho
**Autor:** Gustavo F Penedo

### Antes de começar

Primeiramente, é necessário possuir **Ruby on Rails v 5.1**.

Possuindo a freamework necessária, execute o comando abaixo no diretório do projeto para instalar os pacotes dependentes:

```sh
$ bundle install
```

### 1. Introdução

Esse repositório busca demonstrar as minhas habilidades em programação back-end. As seções abaixo esclarecem melhor as minhas escolhas para cada requisito solicitado.

##### 1.1 Frameworks adicionais

Optou-se pela utilização do pacote RSPEC para fazer os testes dessa aplicação. Todos os testes encontram-se na pasta /spec do projeto. Para executa-los utilize o comando abaixo:

```sh
$ bundle exec rspec
```

### 2. Modelagem

Foram requisitados 4 tabelas, entre elas: **Ie ( Instituição de ensino ), Aluno, Matricula e Fatura**. Todas possuíem os atributos e necessidades de acordo com o pedido inicialmente no projeto.

### 3. Controladores

Conforme solicitado para a solução, os endpoints da aplicação ficaram como demonstrado abaixo.

* **Ies:** Listar Todos  GET /ies | Listar único GET /ies/:id | Inserir POST /ies
* **Alunos:** Listar Todos  GET /alunos | Listar único GET /alunos/:id | Inserir POST /alunos
* **Matriculas:** Listar Todos  GET /matriculass | Listar único GET /matricualas/:id | Inserir POST /matriculas
* **Faturas**: Listar Todos  GET /matriculas/:id/faturas | Listar único GET matriculas/:id/faturas/:id

Por não serem geradas diretamente por uma requisição POST, as faturas são geradas assim que criado um modelo Matricula. De acordo com o Valor Total (**Matricula.valortotal**) da matrícula e a Quantidade de Faturas (**Matricula.fatura**), são geradas faturas com quantidade e Valor da Fatura (**Fatura.valorfatura**) dependentes dos valores mencionados acima. Condizendo com o proposto por esse projeto.

### 4. E-mail

Assim que criado uma matrícula e gerado suas faturas. É enviado ao usuário um e-mail de confirmação sobre sua matrícula conténdo todas as informações requisitadas pelo exercício.

Como é necessário duas contas de e-mail para essa função, uma para envio e outra para recebimento, optei por deixar essa funcionalidade no ambiente teste, onde o e-mail será salvo na variável **ActionMailer::Base**. Com isso também preservou-se os requisitos da tabela Aluno ao não inserir o novo campo e-mail.

### 5. Testes

Os teste foram feitos para testar todas as funcionalidades e requisitos dos Modelos e de suas requisições.

### Notas Finais

Qualquer dúvida com o projeto, favor entrar em contato.


###### Atenciosamente,
## Gustavo F Penedo
---
Engenheiro de Computação | Engenheiro de Inteligência Artificial | Cientista de Dados | Desenvolvedor Full-Stack
**Contato:** gustavo-penedo@hotmail.com
