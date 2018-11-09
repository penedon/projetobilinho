class CreateFaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :faturas do |t|
      t.decimal :valorfatura
      t.date :datavencimento
      t.references :matricula, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
