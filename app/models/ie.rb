class Ie < ApplicationRecord
  enum tipo: {Universidade: 'Universidade', Escola: 'Escola', Creche: 'Creche'}
  validates :cnpj, format: { :with => /\A[0-9]+\z/ }
  validates_uniqueness_of :nome, :cnpj
  validates_presence_of :nome
end
