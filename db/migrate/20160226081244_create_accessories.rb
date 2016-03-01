class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :acc_name
      t.string :variants
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
