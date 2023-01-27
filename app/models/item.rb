class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :province
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  validates :image,            presence: true
  validates :name,             presence: true, length: { maximum: 40 }
  validates :description,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :province_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,            presence: true,
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
