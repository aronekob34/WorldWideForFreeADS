class CompaniesUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :companies_users do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :company, index: true
  	end
  end
end
