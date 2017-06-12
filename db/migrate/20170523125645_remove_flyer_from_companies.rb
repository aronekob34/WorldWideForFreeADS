class RemoveFlyerFromCompanies < ActiveRecord::Migration[5.0]
  def change
  	remove_column :companies, :flyer, :string
  end
end
