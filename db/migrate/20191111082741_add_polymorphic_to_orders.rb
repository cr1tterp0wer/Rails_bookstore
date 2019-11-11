class AddPolymorphicToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_detail_id, :bigint
    add_column :orders, :payment_detail_type, :string
    add_index :orders, [:payment_detail_id, :payment_detail_type]
  end
end
