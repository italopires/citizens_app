class AddUserToCitizen < ActiveRecord::Migration[5.2]
  def change
    add_reference :citizens, :user, foreign_key: true, index: true
  end
end
