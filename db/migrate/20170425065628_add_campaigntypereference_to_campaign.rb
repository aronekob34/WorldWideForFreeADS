class AddCampaigntypereferenceToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_reference :campaigns, :campaigntype, foreign_key: true
  end
end
