class CreateCourseSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :course_sessions do |t|
      t.references :course, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.time :start_time
      t.integer :duration
      t.integer :day_of_week

      t.timestamps
    end
  end
end
