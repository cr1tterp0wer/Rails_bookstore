class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :credit_card_number
      t.string :expiration_date

      t.timestamps
    end
  end
end
