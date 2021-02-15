class AddPictureFileToCitizen < ActiveRecord::Migration[5.2]
  def change
    add_column :citizens, :picture_file, :string
  end
end
