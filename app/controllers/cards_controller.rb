class CardsController < ApplicationController
  def get_card_status
    card_id = params[:card_id]
    contact = params[:contact]
    
    card = if card_id.present?
             Card.find_by(card_id: card_id)
           elsif contact.present?
             Card.find_by(contact: contact)
           end
    
    if card.nil?
      render json: { error: 'Card not found' }, status: :not_found
    else
      card_status = card.get_status
      render json: card_status
    end
  end

  def update_csv
    Pickup.import("Pickup.csv")
    Delivery.import("Delivered.csv")
    DeliveryException.import("Delivery_exceptions.csv")
    Returned.import("Returned.csv")

    render json: { message: 'CSV updated' }, status: :ok
  end
end
