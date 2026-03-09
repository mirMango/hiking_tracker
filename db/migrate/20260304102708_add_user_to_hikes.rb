class AddUserToHikes < ActiveRecord::Migration[8.1]
  def change
    add_column :hikes, :user, :string
  end
end
