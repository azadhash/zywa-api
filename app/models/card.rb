class Card < ApplicationRecord
  self.primary_key = "card_id"
  has_one :returned
  has_one :pickup
  has_one :delivery
  has_many :delivery_exceptions
  enum status: { 'generated' => 'generated','delivered' => 'delivered', 'pickup' => 'pickup', 'returned' => 'returned','exception' => 'exception' }

  def get_status
    if self.status == 'generated'
      return {status: 'generated'}
    elsif self.status == 'delivered'
      return {status: 'delivered', timestamp: self.delivery.timestamp}
    elsif self.status == 'pickup'
      return {status: 'pickup', timestamp: self.pickup.timestamp}
    elsif self.status == 'returned'
      return {status: 'returned', timestamp: self.returned.timestamp}
    elsif self.status == 'exception'
      return {status: 'exception', timestamp: self.delivery_exception.timestamp}
    end
  end
end
