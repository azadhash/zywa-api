# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Card.create(card_id: 'ZYW8827', contact: '585949014', status: 'generated')
Card.create(card_id: 'ZYW8890', contact: '534534534', status: 'generated')
Card.create(card_id: 'ZYW7631', contact: '545576586', status: 'generated')
Card.create(card_id: 'ZYW5890', contact: '232323234', status: 'generated')
Card.create(card_id: 'ZYW6890', contact: '232323434', status: 'generated')


