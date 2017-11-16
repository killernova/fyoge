class AddNickNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :soft_delete, :boolean
  end
end
