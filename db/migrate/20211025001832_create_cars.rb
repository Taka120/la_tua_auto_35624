class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :car_brand, null: false
      t.string :car_name, null: false
      t.date :inspection_date, null: false
      t.string :car_color
      t.string :car_nickname
      t.text :car_condition
      t.timestamps
    end
  end
end
