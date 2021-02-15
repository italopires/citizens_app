class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.string :public_place, null: false
      t.string :complement
      t.string :district, null: false
      t.string :ibge_code
      t.references :citizen, foreign_key: true, index: true, null: false
    end
  end
end
