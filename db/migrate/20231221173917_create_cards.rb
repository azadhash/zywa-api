class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards, id: false do |t|
      t.string :card_id, primary_key: true
      t.string :contact
      t.string :status

      t.timestamps
    end
  end
end
