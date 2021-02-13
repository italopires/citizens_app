class CreateCitizen < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false
      t.string :email, null: false
      t.date :birthdate, null: false
      t.string :phone, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
