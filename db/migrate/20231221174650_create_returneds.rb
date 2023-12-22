class CreateReturneds < ActiveRecord::Migration[7.1]
  def change
    create_table :returneds do |t|
      t.string :timestamp
      t.string :card_id, null: false
      t.timestamps
    end
    add_foreign_key :returneds, :cards, column: :card_id, primary_key: :card_id
  end
end
