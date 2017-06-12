class AddCompanyRefToCampaigns < ActiveRecord::Migration[5.0]
  def up
    add_reference :campaigns, :company, foreign_key: true
  end
  def down
  	#remove_columns(:campaigns, :company_id)
  	#remove_foreign_key :campaigns, name: :company_id
  	remove_reference :campaigns, :company, foreign_key: true
  end
end