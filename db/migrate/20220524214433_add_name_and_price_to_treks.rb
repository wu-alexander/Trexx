class AddNameAndPriceToTreks < ActiveRecord::Migration[6.1]
  def change
    add_column :treks, :name, :string
    add_column :treks, :price, :integer
  end
end
