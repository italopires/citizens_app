class AddIndexToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_index :addresses, :zipcode
    add_index :addresses, :public_place
    add_index :addresses, :district
    add_index :addresses, :ibge_code
  end
end
