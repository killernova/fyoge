class CreateCourseTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :course_times do |t|
      t.integer :serial_number
      t.time :start_at
      t.time :end_at
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
