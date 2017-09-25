class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.integer :level
      t.datetime :valid_after
      t.datetime :valid_before
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
