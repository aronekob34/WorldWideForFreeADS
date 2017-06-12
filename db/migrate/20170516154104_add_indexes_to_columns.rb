class AddIndexesToColumns < ActiveRecord::Migration[5.0]
  def change
  	add_index :companytypes, :name
  	add_index :campaigns, :created_at
  	add_index :campaigns, :visitratio
  	add_index :campaigns, :ads_received
  	add_index :runs, :status
  	add_index :ads, :visits
  end
end
