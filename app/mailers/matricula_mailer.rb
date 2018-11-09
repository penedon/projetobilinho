class MatriculaMailer < ApplicationMailer
  default from: "financas@bilinho.com"

  def welcome_mail(matricula, ie, aluno)
    valorfatura = matricula.valortotal / matricula.fatura
    mail(to: "aluno@mail.com",
         subject: "Bem Vindo à #{ie.nome}",
         body: "Caro #{aluno.nome}, sua matrícula no curso #{matricula.curso} foi efetuada com sucesso. \n
              \nSua fatura terá vencimento no próximo dia #{matricula.diavencimento} no valor de R$#{valorfatura}\n
              \nAtt,\n
              \nDiretoria")

  end
end
