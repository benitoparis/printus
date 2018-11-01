class AddYearToGigs < ActiveRecord::Migration[5.2]
  def change
        add_column :gigs, :year, :integer, :after => :month
  end
end
