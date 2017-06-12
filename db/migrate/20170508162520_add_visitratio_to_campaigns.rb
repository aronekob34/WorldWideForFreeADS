class AddVisitratioToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :visitratio, :integer
  end
end
