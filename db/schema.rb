# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181103152704) do

  create_table "alunos", force: :cascade do |t|
    t.text "nome"
    t.text "cpf"
    t.date "dnascimento"
    t.integer "celular"
    t.text "genero"
    t.text "tipopagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_alunos_on_cpf", unique: true
    t.index ["nome"], name: "index_alunos_on_nome", unique: true
  end

  create_table "faturas", force: :cascade do |t|
    t.decimal "valorfatura"
    t.date "datavencimento"
    t.integer "matricula_id"
    t.text "status", default: "Aberta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matricula_id"], name: "index_faturas_on_matricula_id"
  end

  create_table "ies", force: :cascade do |t|
    t.text "nome"
    t.text "cnpj"
    t.text "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_ies_on_cnpj", unique: true
    t.index ["nome"], name: "index_ies_on_nome", unique: true
  end

  create_table "matriculas", force: :cascade do |t|
    t.decimal "valortotal"
    t.integer "fatura"
    t.integer "diavencimento"
    t.text "curso"
    t.integer "ie_id"
    t.integer "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["ie_id"], name: "index_matriculas_on_ie_id"
  end

end
