class AddColorToUserInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :user_infos, :color, :string
  end
end
