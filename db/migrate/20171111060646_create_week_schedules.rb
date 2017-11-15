class CreateWeekSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :week_schedules do |t|
      t.date :start_at
      t.string :week

      t.timestamps
    end
  end
end
