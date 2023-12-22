class DeliveryException < ApplicationRecord
  require 'csv'
  belongs_to :card
  def self.import(file)
    file_path = Rails.root.join('app', 'data', file)
    opened_file = File.open(file_path)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      delivery_exception = {}
      delivery_exception[:card_id] = row['Card ID']
      delivery_exception[:timestamp] = row['Timestamp']
      delivery_exception[:comment] = row['Comment']

      DeliveryException.create!(delivery_exception)
      Card.find(row['Card ID']).update(status: 'exception');
    end
  end
end
