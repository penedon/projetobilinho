# Solu��o: Projeto Bilinho
**Autor:** Gustavo F Penedo

### Antes de come�ar

Primeiramente, � necess�rio possuir **Ruby on Rails v 5.1**.

Possuindo a freamework necess�ria, execute o comando abaixo no diret�rio do projeto para instalar os pacotes dependentes:

```sh
$ bundle exec install
```

### 1. Introdu��o

Esse reposit�rio busca demonstrar as minhas habilidades em programa��o back-end. As se��es abaixo esclarecem melhor as minhas escolhas para cada requisito solicitado.

##### 1.1 Frameworks adicionais

Optou-se pela utiliza��o do pacote RSPEC para fazer os testes dessa aplica��o. Todos os testes encontram-se na pasta /spec do projeto. Para executa-los utilize o comando abaixo:

```sh
$ bundle exec rspec
```

### 2. Modelagem

Foram requisitados 4 tabelas, entre elas: **Ie ( Institui��o de ensino ), Aluno, Matricula e Fatura**. Todas possu�em os atributos e necessidades de acordo com o pedido inicialmente no projeto.

### 3. Controladores

Conforme solicitado para a solu��o, os endpoints da aplica��o ficaram como demonstrado abaixo.

* **Ies:** Listar Todos  GET /ies | Listar �nico GET /ies/:id | Inserir POST /ies
* **Alunos:** Listar Todos  GET /alunos | Listar �nico GET /alunos/:id | Inserir POST /alunos
* **Matriculas:** Listar Todos  GET /matriculass | Listar �nico GET /matricualas/:id | Inserir POST /matriculas
* **Faturas**: Listar Todos  GET /matriculas/:id/faturas | Listar �nico GET matriculas/:id/faturas/:id

Por n�o serem geradas diretamente por uma requisi��o POST, as faturas s�o geradas assim que criado um modelo Matricula. De acordo com o Valor Total (**Matricula.valortotal**) da matr�cula e a Quantidade de Faturas (**Matricula.fatura**), s�o geradas faturas com quantidade e Valor da Fatura (**Fatura.valorfatura**) dependentes dos valores mencionados acima. Condizendo com o proposto por esse projeto.

### 4. E-mail

Assim que criado uma matr�cula e gerado suas faturas. � enviado ao usu�rio um e-mail de confirma��o sobre sua matr�cula cont�ndo todas as informa��es requisitadas pelo exerc�cio.

Como � necess�rio duas contas de e-mail para essa fun��o, uma para envio e outra para recebimento, optei por deixar essa funcionalidade no ambiente teste, onde o e-mail ser� salvo na vari�vel **ActionMailer::Base**. Com isso tamb�m preservou-se os requisitos da tabela Aluno ao n�o inserir o novo campo e-mail.

### 5. Testes

Os teste foram feitos para testar todas as funcionalidades e requisitos dos Modelos e de suas requisi��es.

### Notas Finais

Qualquer d�vida com o projeto, favor entrar em contato.


###### Atenciosamente,
## Gustavo F Penedo
---
Engenheiro de Computa��o | Engenheiro de Intelig�ncia Artificial | Cientista de Dados | Desenvolvedor Full-Stack
**Contato:** gustavo-penedo@hotmail.com