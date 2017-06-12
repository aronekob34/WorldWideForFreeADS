class AddFlyerToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :flyer, :string
  end
end
