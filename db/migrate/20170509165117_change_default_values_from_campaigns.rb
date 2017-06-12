class ChangeDefaultValuesFromCampaigns < ActiveRecord::Migration[5.0]
  def up
  	change_column :campaigns, :givenvisits, :integer, :default => 1
	change_column :campaigns, :obtainedvisits, :integer, :default => 1
	change_column :campaigns, :visitratio, :integer, :default => 1
	change_column :campaigns, :ads_received,:integer,  :default => 0
  end
  def down
  	change_column :campaigns, :givenvisits, :integer, :default => nil
	change_column :campaigns, :obtainedvisits, :integer, :default => nil
	change_column :campaigns, :visitratio, :integer, :default => nil
	change_column :campaigns, :ads_received, :integer,:default => nil
  end  
end
