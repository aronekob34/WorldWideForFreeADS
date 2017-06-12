class AddFieldsToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :runs, :campaign, foreign_key: true
    add_column :runs, :runprintnumber, :integer
    add_column :runs, :ownads, :integer
  end
end
