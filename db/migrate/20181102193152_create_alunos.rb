class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :dnascimento
      t.integer :celular
      t.text :genero
      t.text :tipopagamento

      t.timestamps
    end
    add_index :alunos, :nome, unique: true
    add_index :alunos, :cpf, unique: true
  end
end
