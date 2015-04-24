class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :woeid
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
