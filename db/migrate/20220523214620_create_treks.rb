class CreateTreks < ActiveRecord::Migration[6.1]
  def change
    create_table :treks do |t|
      t.string :start_location
      t.string :difficulty
      t.integer :duration_days
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
