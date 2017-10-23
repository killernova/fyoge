class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.boolean :default, default: false
      t.timestamps
    end
  end
end
