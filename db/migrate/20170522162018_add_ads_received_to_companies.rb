class AddAdsReceivedToCompanies < ActiveRecord::Migration[5.0]
  def change
  	add_column :companies, :ads_received, :integer, default: 0
  end
end
