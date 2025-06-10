class CreateStudentCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :student_courses do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :average_grade
      t.boolean :credit_obtained

      t.timestamps
    end
  end
end
