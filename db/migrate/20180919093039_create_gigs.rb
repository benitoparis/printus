class CreateGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :price
      t.string :source
      t.integer :month
      t.integer :year
      t.integer :quantity_interne
      t.integer :quantity_edt

      t.timestamps
    end
  end
end

