class CreateTables < ActiveRecord::Migration[6.0]
  def change
    # enable_extension "pgcrypto"
    # enable_extension "plpgsql"
    # enable_extension "uuid-ossp"

    create_table "invoices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string "invoice_number"
      t.string "subject"
      t.datetime "due_date"
      t.string "original_file"
      t.monetize "amount_vat_excluded"
      t.monetize "amount_vat_included"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "notifications", force: :cascade do |t|
      t.uuid "invoice_id", null: false
      t.uuid "recipient_id", null: false
      t.datetime "created_at", null: false
    end

    create_table "recipients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.uuid "public_id", default: -> { "gen_random_uuid()" }, null: false
      t.uuid "api_token", default: -> { "gen_random_uuid()" }, null: false
    end

    create_table "visits", force: :cascade do |t|
      t.uuid "invoice_id", null: false
      t.uuid "recipient_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

  end
end
