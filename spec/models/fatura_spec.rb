require 'rails_helper'

RSpec.describe Fatura, type: :model do
  record_ie = Ie.new(nome: "test", cnpj: "2135453")
  record_aluno =  Aluno.new(nome: "t", cpf: "1",
                        genero: "M", tipopagamento: "Boleto")
  record_matricula = Matricula.new(valortotal: 10, fatura: 12, diavencimento:10,
                     curso:"Engenharia", ie:record_ie, aluno:record_aluno)
  record = Fatura.new(valorfatura: 500, datavencimento:01/01/2019,
                             matricula:record_matricula)
  context 'validation tests' do
    it {
      should validate_presence_of(:valorfatura)
      should validate_presence_of(:datavencimento)
      should validate_presence_of(:matricula)
      should validate_presence_of(:status)

    }
    it {
      expect(record.status).to eq("Aberta")
      expect {record.status = 'Sumiu'}.to raise_error(ArgumentError)
      expect {record.status = 'Atrasada'}.to_not raise_error
      expect {record.status = 'Paga'}.to_not raise_error
    }

  end
end
