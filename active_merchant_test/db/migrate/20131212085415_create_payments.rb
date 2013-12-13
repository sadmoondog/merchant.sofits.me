class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.text :service
      t.float :amount
      t.integer :status
      t.string :date

      t.timestamps
    end
  end
end
