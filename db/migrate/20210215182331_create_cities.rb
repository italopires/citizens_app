class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :state, foreign_key: true, index: true

      t.timestamps
    end

    add_reference :citizens, :city, foreign_key: true, index: true
  end
end
