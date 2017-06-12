class AddCityLocationToRuns < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :city, :string
    add_column :runs, :location, :string
  end
end
