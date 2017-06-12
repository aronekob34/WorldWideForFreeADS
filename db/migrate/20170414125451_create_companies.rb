class CreateCompanies < ActiveRecord::Migration[5.0]
  def up
    create_table :companies do |t|
      t.references :companytype, foreign_key: true
      t.string :name
      t.string :title
      t.string :description
      t.string :website

      t.timestamps
    end
  end
  def down
    drop_table :companies
  end  
end
