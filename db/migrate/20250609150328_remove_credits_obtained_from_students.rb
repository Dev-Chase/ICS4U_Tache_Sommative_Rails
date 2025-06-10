class RemoveCreditsObtainedFromStudents < ActiveRecord::Migration[7.2]
  def change
    remove_column :students, :credits_obtained, :integer
  end
end
