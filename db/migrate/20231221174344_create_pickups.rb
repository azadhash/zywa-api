class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|
      t.string :card_id, null: false
      t.string :timestamp

      t.timestamps
    end
    add_foreign_key :pickups, :cards, column: :card_id, primary_key: :card_id

  end
end
