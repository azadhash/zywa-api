class CreateDeliveryExceptions < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_exceptions do |t|
      t.string :card_id, null: false
      t.string :timestamp
      t.string :comment

      t.timestamps
    end
    add_foreign_key :delivery_exceptions, :cards, column: :card_id, primary_key: :card_id
  end
end
