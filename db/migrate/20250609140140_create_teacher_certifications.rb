class CreateTeacherCertifications < ActiveRecord::Migration[7.2]
  def change
    create_table :teacher_certifications do |t|
      t.string :certifier
      t.datetime :date_obtained
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# TODO: add signature? (would have to be a file)
