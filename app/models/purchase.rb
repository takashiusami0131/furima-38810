class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :province

  belongs_to :user
  belongs_to :item
  has_one    :address
end
