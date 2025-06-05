class CreateJoinTableRecipientPms < ActiveRecord::Migration[8.0]
  def change
    create_table :join_table_recipient_pms do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end