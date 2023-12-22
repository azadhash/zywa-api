class Delivery < ApplicationRecord
  require 'csv'

  belongs_to :card

  def self.import(file)
    file_path = Rails.root.join('app', 'data', file)
    opened_file = File.open(file_path)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      delivery = {}
      delivery[:card_id] = row['Card ID']
      delivery[:timestamp] = row['Timestamp']
      
      Delivery.find_or_create_by!(delivery)
      Card.find(row['Card ID']).update(status: 'delivered');
    end
  end
end
