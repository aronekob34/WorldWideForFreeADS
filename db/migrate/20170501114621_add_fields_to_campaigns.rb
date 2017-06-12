class AddFieldsToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :worldwide, :boolean
    add_column :campaigns, :america, :boolean
    add_column :campaigns, :europe, :boolean
    add_column :campaigns, :asia, :boolean
    add_column :campaigns, :oceania, :boolean
  end
end
