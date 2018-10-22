class Reordercolmonthandyearfromgigs < ActiveRecord::Migration[5.2]
  def change

    change_column :gigs, :month, :integer, after: :source
    change_column :gigs, :year, :integer, before: :quantity_interne
  end
end
