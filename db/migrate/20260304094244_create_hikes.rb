class CreateHikes < ActiveRecord::Migration[8.1]
  def change
    create_table :hikes do |t|
      t.string :name
      t.float :distance
      t.text :description

      t.timestamps
    end
  end
end
