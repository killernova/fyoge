class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :wechat_name
      t.string :sex
      t.integer :role

      t.timestamps
    end
  end
end
