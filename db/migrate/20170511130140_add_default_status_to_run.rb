class AddDefaultStatusToRun < ActiveRecord::Migration[5.0]
  def up
  	change_column :runs, :status, :string, :default => "to print"
  end
  def down
  	change_column :runs, :status, :string, :default => nil
  end  
end
