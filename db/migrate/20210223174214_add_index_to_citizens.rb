class AddIndexToCitizens < ActiveRecord::Migration[5.2]
  def change
    add_index :citizens, :full_name
    add_index :citizens, :cpf
    add_index :citizens, :email
  end
end
