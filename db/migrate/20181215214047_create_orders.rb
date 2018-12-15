class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :appliance_model
      t.string :imei
      t.money :anual_price
      t.integer :parcels_number

      t.timestamps
    end
  end
end
