class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :uid, limit: 120, null: false
      t.string :provider,         null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index "authorizations", ["provider", "uid"], name: "index_auths_on_provider_uid", using: :btree
  end
end
