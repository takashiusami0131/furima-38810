class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code, :province_id, :city, :address_line1, :building, :phone_number, :user_id, :item_id, :token,
                :purchase_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address_line1
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short or long' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :province_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, province_id: province_id, city: city, address_line1: address_line1,
                   building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
