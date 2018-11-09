FactoryBot.define do
  factory :aluno do
    nome { Faker::Name.name_with_middle }
    cpf { Faker::Number.number(11) }
    dnascimento {}
    celular {}
    genero { ["M","F"].sample }
    tipopagamento { ["Cartão", "Boleto"].sample }
  end
end
