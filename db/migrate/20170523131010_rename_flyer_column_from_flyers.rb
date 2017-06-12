class RenameFlyerColumnFromFlyers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :flyers, :flyer, :image
  end
end
