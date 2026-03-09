class AddUserIdToHikes < ActiveRecord::Migration[8.1]
  def change
    add_reference :hikes, :user, null: true, foreign_key: true
  end
end
