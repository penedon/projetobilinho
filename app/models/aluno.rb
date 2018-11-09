class Aluno < ApplicationRecord
  enum genero: {M:'M', F:'F'}
  enum tipopagamento: {Boleto: 'Boleto', Cartão:'Cartão'}

  validates :cpf, format: { :with => /\A[0-9]+\z/ }

  validates_uniqueness_of :nome, :cpf
  validates_presence_of :nome, :cpf, :genero, :tipopagamento
end
