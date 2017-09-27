class AddSerialNumberToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :serial_number, :integer
    add_column :schedules, :weekday, :integer
    add_column :courses, :color, :string
  end
end
