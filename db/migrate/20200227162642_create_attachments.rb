class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :original_file
      t.uuid :invoice_id
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    remove_column :invoices, :original_file
  end
end
