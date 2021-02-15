class Address < ApplicationRecord
  validates :zipcode, :public_place, :district, presence: true
end