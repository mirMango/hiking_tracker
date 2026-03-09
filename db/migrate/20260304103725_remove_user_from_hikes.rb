class RemoveUserFromHikes < ActiveRecord::Migration[8.1]
  def change
    remove_column :hikes, :user, :string
  end
end
