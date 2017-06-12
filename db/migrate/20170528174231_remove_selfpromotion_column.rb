class RemoveSelfpromotionColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :ads, :selfpromotion, :boolean
  end
end
