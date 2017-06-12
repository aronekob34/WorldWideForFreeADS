class AddAdsReceivedToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :ads_received, :integer
  end
end
