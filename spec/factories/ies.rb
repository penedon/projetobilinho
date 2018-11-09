FactoryBot.define do
  factory :ie do
    nome { Faker::University.name }
    cnpj { Faker::Number.number(14) }
    tipo { ["Universidade", "Escola", "Creche"].sample }
  end
end
