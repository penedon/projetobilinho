class Matricula < ApplicationRecord
  belongs_to :ie
  belongs_to :aluno

  has_many :faturas, dependent: :destroy


  validates :valortotal, numericality: {greater_than: 0}
  validates :fatura, numericality: {
                                  greater_than_or_equal_to: 1
                               }
  validates :diavencimento,
             numericality: {
                greater_than_or_equal_to: 1,
                less_than_or_equal_to: 31
             }


  validates_presence_of :valortotal, :fatura, :diavencimento,
                        :curso, :ie, :aluno

  def generate_fatura
    today = Date.today
    payday = self.diavencimento
    payday <= today.day ? today = today >> 1 : nil
    paydate = Date.new(today.year,today.month,payday)
    for x in 1..self.fatura.to_i do
      Fatura.create!(valorfatura: self.valortotal / self.fatura,
                       datavencimento: paydate >> x - 1,
                       matricula_id:self.id)
    end
  end

  def send_welcome_mail(ie,aluno)
    MatriculaMailer.welcome_mail(self, ie, aluno).deliver_now
  end
end
