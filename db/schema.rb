# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_02_033651) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arbitragems", force: :cascade do |t|
    t.string "type"
    t.bigint "partida_id", null: false
    t.bigint "pessoa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partida_id", "pessoa_id"], name: "index_arbitragems_on_partida_id_and_pessoa_id", unique: true
    t.index ["partida_id"], name: "index_arbitragems_on_partida_id"
    t.index ["pessoa_id"], name: "index_arbitragems_on_pessoa_id"
  end

  create_table "assocs", force: :cascade do |t|
    t.bigint "pessoa_id", null: false
    t.bigint "clube_id", null: false
    t.date "data_inicio", null: false
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clube_id"], name: "index_assocs_on_clube_id"
    t.index ["pessoa_id"], name: "index_assocs_on_pessoa_id"
  end

  create_table "clubes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "localidade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome", "localidade"], name: "index_clubes_on_nome_and_localidade", unique: true
    t.index ["nome"], name: "index_clubes_on_nome"
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_equipes_on_nome"
  end

  create_table "eventos", force: :cascade do |t|
    t.bigint "liga_id", null: false
    t.string "nome", null: false
    t.date "data_inicio"
    t.date "data_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liga_id"], name: "index_eventos_on_liga_id"
    t.index ["nome"], name: "index_eventos_on_nome", unique: true
  end

  create_table "faltas", force: :cascade do |t|
    t.bigint "particip_id", null: false
    t.string "consequencia", default: "comum", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["particip_id"], name: "index_faltas_on_particip_id"
  end

  create_table "fases", force: :cascade do |t|
    t.bigint "evento_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_fases_on_evento_id"
  end

  create_table "ligas", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_ligas_on_nome", unique: true
  end

  create_table "particips", force: :cascade do |t|
    t.boolean "eh_coringa", default: false, null: false
    t.bigint "pessoa_id", null: false
    t.bigint "equipe_id", null: false
    t.bigint "partida_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_particips_on_equipe_id"
    t.index ["partida_id"], name: "index_particips_on_partida_id"
    t.index ["pessoa_id", "equipe_id", "partida_id"], name: "index_particips_on_pessoa_id_and_equipe_id_and_partida_id", unique: true
    t.index ["pessoa_id"], name: "index_particips_on_pessoa_id"
  end

  create_table "partidas", force: :cascade do |t|
    t.integer "ordem"
    t.bigint "fase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fase_id", "ordem"], name: "index_partidas_on_fase_id_and_ordem", unique: true
    t.index ["fase_id"], name: "index_partidas_on_fase_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome", null: false
    t.date "data_nascimento"
    t.boolean "eh_mtnb", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_pessoas_on_nome"
  end

  create_table "tematicos", force: :cascade do |t|
    t.bigint "evento_id", null: false
    t.bigint "equipe_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_tematicos_on_equipe_id"
    t.index ["evento_id", "equipe_id"], name: "index_tematicos_on_evento_id_and_equipe_id", unique: true
    t.index ["evento_id"], name: "index_tematicos_on_evento_id", unique: true
  end

  add_foreign_key "arbitragems", "partidas"
  add_foreign_key "arbitragems", "pessoas"
  add_foreign_key "assocs", "clubes"
  add_foreign_key "assocs", "pessoas"
  add_foreign_key "eventos", "ligas"
  add_foreign_key "faltas", "particips"
  add_foreign_key "fases", "eventos"
  add_foreign_key "particips", "equipes"
  add_foreign_key "particips", "partidas"
  add_foreign_key "particips", "pessoas"
  add_foreign_key "partidas", "fases"
  add_foreign_key "tematicos", "equipes"
  add_foreign_key "tematicos", "eventos"
end
