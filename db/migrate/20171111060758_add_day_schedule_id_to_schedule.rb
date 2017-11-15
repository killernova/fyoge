class AddDayScheduleIdToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :day_schedule_id, :integer, index: true
  end
end
