class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
