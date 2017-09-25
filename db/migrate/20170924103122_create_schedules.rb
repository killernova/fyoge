class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :date
      t.integer :course_id

      t.timestamps
    end
  end
end
