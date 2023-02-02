class PurchaseForm
  include ActiveModel::Model
 
  attr_accessor :postal_code, :province_id, :city, :address_line1, :building, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :province_id
    validates :city
    validates :address_line1
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
  end

 
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,  province_id:  province_id, city: city, address_line1: address_line1, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
 end