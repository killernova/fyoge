class CreateDaySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :day_schedules do |t|
      t.integer :week_schedule_id, index: true
      t.date :start_at

      t.timestamps
    end
  end
end
