class AddGivenvisitsObtainedvisitsToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :givenvisits, :integer
    add_column :campaigns, :obtainedvisits, :integer
  end
end
