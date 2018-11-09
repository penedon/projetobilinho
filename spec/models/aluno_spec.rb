require 'rails_helper'

RSpec.describe Aluno, type: :model do
  record = Aluno.new(nome: "t", cpf: "1",
         genero: "M", tipopagamento: "Boleto")
  context 'validation tests' do
    it {
      should validate_presence_of(:nome)
      should validate_presence_of(:cpf)
      should validate_presence_of(:genero)
      should validate_presence_of(:tipopagamento)
    }
    it {
      should validate_uniqueness_of(:nome)
      should validate_uniqueness_of(:cpf)
    }
    it "Check genero values" do
      expect {
        record.genero = 'H'
      }.to raise_error(ArgumentError)
    end
    it "Check tipopagamento values" do
      expect {
        record.tipopagamento = 'Dinheiro'
      }.to raise_error(ArgumentError)
    end
    it "Check CPF values" do
      record.cpf = 'asdasd32q34235'
      expect(record).to_not be_valid
      record.cpf = '34235'
      expect(record).to be_valid
    end
  end
end
