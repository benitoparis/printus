class RemovemonthandyearFromgigs < ActiveRecord::Migration[5.2]
  def change
    remove_column :gigs, :month
    remove_column :gigs, :year
  end
end
