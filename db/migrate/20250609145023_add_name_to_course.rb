class AddNameToCourse < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :name, :string
  end
end
