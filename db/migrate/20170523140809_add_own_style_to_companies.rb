class AddOwnStyleToCompanies < ActiveRecord::Migration[5.0]
  def change
  	add_column :companies, :own_style, :boolean, :default => true
  end
end
