class Fatura < ApplicationRecord
  enum status: {Aberta: 'Aberta', Atrasada: 'Atrasada', Paga: 'Paga'}
  belongs_to :matricula

  validates_presence_of :valorfatura, :datavencimento,
                        :matricula, :status

  after_initialize :init

    def init
      self.status  ||= "Aberta"
    end
end
