class CreateIes < ActiveRecord::Migration[5.1]
  def change
    create_table :ies do |t|
      t.text :nome
      t.text :cnpj
      t.text :tipo

      t.timestamps
    end
    add_index :ies, :nome, unique: true
    add_index :ies, :cnpj, unique: true
  end
end
