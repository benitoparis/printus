class Addmonthyeartogigs < ActiveRecord::Migration[5.2]
  def change
    add_column :gigs, :month, :integer, :after => :source

  end
end
