require 'rails_helper'

RSpec.describe Ie, type: :model do
  context 'validation tests' do
    it { should validate_presence_of(:nome) }
    it { should validate_uniqueness_of(:nome) }

    it { should validate_uniqueness_of(:cnpj) }
    it "check if cnpj is valid with only num" do
      record = Ie.new(nome: "test", cnpj: "2135453")
      expect(record).to be_valid
    end
    it "check if cnpj is not valid with words" do
      record = Ie.new(nome: "test", cnpj: "dddd53")
      expect(record).to_not be_valid
    end
    it "check if tipo accepts a value contained in its enum" do
      record = Ie.new(nome: "t", cnpj: "1", tipo: "Creche")
      expect(record).to be_valid
      expect(record.tipo).to eq('Creche')
    end
    it "check if tipo accepts other value than its enum" do
      expect {
        Ie.new(nome: "t", cnpj: "1", tipo: "Empresa")
      }.to raise_error(ArgumentError)
    end


  end
end
