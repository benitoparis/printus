class RemovedecimalFromgigs < ActiveRecord::Migration[5.2]
  def change
    remove_column :gigs, :decimal, :string
  end
end
