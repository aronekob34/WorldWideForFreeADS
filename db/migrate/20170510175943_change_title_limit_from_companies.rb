class ChangeTitleLimitFromCompanies < ActiveRecord::Migration[5.0]
  def up
  	change_column :companies, :title, :string, :limit => 70
  end
  def down
  	change_column :companies, :title, :string, :limit => nil
  end
end
