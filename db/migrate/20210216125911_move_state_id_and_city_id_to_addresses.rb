class MoveStateIdAndCityIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :citizens, :city_id
    add_reference :addresses, :city, foreign_key: true, index: true

    remove_column :citizens, :state_id
    add_reference :addresses, :state, foreign_key: true, index: true
  end
end
