class AddSelfpromotionToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :selfpromotion, :boolean
  end
end
