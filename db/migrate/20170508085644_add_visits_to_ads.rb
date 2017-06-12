class AddVisitsToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :visits, :integer
  end
end
