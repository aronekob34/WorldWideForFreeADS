class AddStatusToRuns < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :status, :string
  end
end
