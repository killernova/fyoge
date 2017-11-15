class AddSeasionIdToWeekSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :week_schedules, :season_id, :integer, index: true
  end
end
