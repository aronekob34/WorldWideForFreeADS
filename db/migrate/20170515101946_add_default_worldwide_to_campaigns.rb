class AddDefaultWorldwideToCampaigns < ActiveRecord::Migration[5.0]
  def up
  	change_column :campaigns, :worldwide, :boolean, :default => true
  end
  def down
  	change_column :campaigns, :worldwide, :boolean, :default => nil
  end  
end
