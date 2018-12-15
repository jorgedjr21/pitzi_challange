class Order < ApplicationRecord
  belongs_to :user

  validates :imei, presence: true, allow_blank: false
  validates :appliance_model, presence: true, allow_blank: false
  validates :anual_price, presence: true, allow_blank: false, numericality:{ greater_than: 0 }
end
