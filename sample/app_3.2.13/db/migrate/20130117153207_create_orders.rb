class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :delivery_on
      t.string :product_name
      t.string :tenant_name
      t.references :user

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
