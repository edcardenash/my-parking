class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.float :price_per_day
      t.text :description
      t.boolean :covered
      t.string :vehicle_type
      t.references :city, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
