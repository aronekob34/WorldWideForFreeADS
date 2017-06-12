class AddSelfpromotionColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :ads, :selfpromotion, :boolean, :default => false
  end
end
