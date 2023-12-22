class Returned < ApplicationRecord
  require 'csv'

  belongs_to :card
  def self.import(file)
    file_path = Rails.root.join('app', 'data', file)
    opened_file = File.open(file_path)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      returned = {}
      returned[:card_id] = row['Card ID']
      returned[:timestamp] = row['Timestamp']

      Returned.find_or_create_by!(returned)
      Card.find(row['Card ID']).update(status: 'returned');
    end
  end
end
