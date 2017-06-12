class RemoveColumnsAndClearCounters < ActiveRecord::Migration[5.0]
  def up
  	remove_column :ads, :visits, :integer, :default => 0
  	remove_column :campaigns, :givenvisits, :integer, :default => 1   	
  	remove_column :campaigns, :obtainedvisits, :integer, :default => 1   
  	remove_column :campaigns, :visitratio, :decimal, :precision => 5, :scale => 4, :default => 1   
  	remove_column :campaigns, :ads_received, :integer, :default => 0 
  end

  def down
  	add_column :ads, :visits, :integer, :default => 0
  	add_column :campaigns, :givenvisits, :integer, :default => 1   	
  	add_column :campaigns, :obtainedvisits, :integer, :default => 1   
  	add_column :campaigns, :visitratio, :decimal, :precision => 5, :scale => 4, :default => 1   
  	add_column :campaigns, :ads_received, :integer, :default => 0 

    add_index :campaigns, :visitratio
    add_index :campaigns, :ads_received
    add_index :ads, :visits
  end  
end
