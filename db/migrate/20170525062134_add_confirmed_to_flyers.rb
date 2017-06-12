class AddConfirmedToFlyers < ActiveRecord::Migration[5.0]
  def change
  	add_column :flyers, :confirmed, :boolean, :default => false
  	add_index :flyers, :confirmed 
  end
end
