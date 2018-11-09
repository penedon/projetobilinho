class CreateMatriculas < ActiveRecord::Migration[5.1]
  def change
    create_table :matriculas do |t|
      t.decimal :valortotal
      t.integer :fatura
      t.integer :diavencimento
      t.text :curso
      t.references :ie, foreign_key: true
      t.references :aluno, foreign_key: true

      t.timestamps
    end
  end
end
