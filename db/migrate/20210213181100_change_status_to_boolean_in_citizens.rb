class ChangeStatusToBooleanInCitizens < ActiveRecord::Migration[5.2]
  def up
    change_column :citizens, :status, :boolean, default: true, using: 'status::boolean'
  end

  def down
    change_column :citizens, :status, :string
  end
end
