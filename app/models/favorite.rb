class Favorite < ApplicationRecord
  VALID_SHOP_ID_REGEX = /\AJ[0-9]{9}\z/i.freeze
  validates :shop_id, presence: true, length: { is: 10 }, uniqueness: true, format: { with: VALID_SHOP_ID_REGEX }
  validates :name, presence: true
  validates :genre, presence: true
  validates :open, presence: true
  validates :photo, presence: true
end
