class CreateCampaigntypes < ActiveRecord::Migration[5.0]
  def up
    create_table :campaigntypes do |t|
      t.string :name

      t.timestamps
    end
  end
  def down
  	drop_table :campaigntypes
  end
end
