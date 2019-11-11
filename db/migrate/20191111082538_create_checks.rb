class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.string :routing_number
      t.string :account_number

      t.timestamps
    end
  end
end
