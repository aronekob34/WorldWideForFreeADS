class CreateCampaigns < ActiveRecord::Migration[5.0]
  def up
    create_table :campaigns do |t|
      t.string :name
      t.string :targetcountries

      t.timestamps
    end
  end
  def down
  	drop_table :campaigns
  end
end
