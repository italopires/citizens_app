class Address < ApplicationRecord
  belongs_to :state
  belongs_to :city
  belongs_to :citizen

  validates :zipcode, :public_place, :district, :city_id, :state_id, presence: true
end