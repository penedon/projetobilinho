FactoryBot.define do
  factory :matricula do
    valortotal { 9600 }
    fatura { 12 }
    diavencimento { 10 }
    curso { Faker::Job.field }
    ie_id {nil}
    aluno_id {nil}
  end
end
