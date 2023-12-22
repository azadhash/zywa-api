class Pickup < ApplicationRecord
  require 'csv'

  belongs_to :card

  def self.import(file)
    file_path = Rails.root.join('app', 'data', file)
    opened_file = File.open(file_path)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      pickup = {}
      pickup[:card_id] = row['Card ID']
      pickup[:timestamp] = row['Timestamp']

      Pickup.find_or_create_by!(pickup)
      Card.find(row['Card ID']).update(status: 'pickup');
    end
  end
end
