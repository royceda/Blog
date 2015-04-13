class AddUserToWeather < ActiveRecord::Migration
  def change
    add_column :weathers, :user_id, :integer
  end
end
