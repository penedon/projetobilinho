require 'rails_helper'

RSpec.describe Matricula, type: :model do
  record_ie = Ie.new(nome: "test", cnpj: "2135453")
  record_aluno =  Aluno.new(nome: "t", cpf: "1",
                        genero: "M", tipopagamento: "Boleto")
  record = Matricula.new(valortotal: 10, fatura: 12, diavencimento:10,
                     curso:"Engenharia", ie:record_ie, aluno:record_aluno)
  context 'validation tests' do
    it {
      should validate_presence_of(:valortotal)
      should validate_presence_of(:fatura)
      should validate_presence_of(:diavencimento)
      should validate_presence_of(:curso)
      should validate_presence_of(:ie)
      should validate_presence_of(:aluno)
    }
    it {
      should belong_to(:ie)
      should belong_to(:aluno)
    }
    it {
      record.valortotal = 0
      expect(record).to_not be_valid
      record.valortotal = 1
    }
    it {
      expect(record).to be_valid
      record.fatura = 0
      expect(record).to_not be_valid
      record.fatura = 1
    }
    it {
      expect(record).to be_valid
      record.diavencimento = 0
      expect(record).to_not be_valid
      record.diavencimento = 32
      expect(record).to_not be_valid
      record.diavencimento = 10
    }
    
  end
end
