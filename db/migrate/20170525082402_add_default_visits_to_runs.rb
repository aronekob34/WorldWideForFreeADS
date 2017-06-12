class AddDefaultVisitsToRuns < ActiveRecord::Migration[5.0]
  def up
  	change_column :ads, :visits, :integer, :default => 0
  end
  def down
  	change_column :ads, :visits, :integer, :default => nil
  end  
end
