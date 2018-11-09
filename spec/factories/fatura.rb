FactoryBot.define do
    factory :fatura do
      valorfatura { 800 }
      datavencimento { DateTime.now }
      matricula_id {nil}
      status {['Paga','Aberta'].sample}
    end
  end
