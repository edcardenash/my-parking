class AddRentedColumnToParkings < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :rented, :boolean
  end
end
