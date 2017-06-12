class ChangeColumnWebsite < ActiveRecord::Migration[5.0]
  def change
  	rename_column :companies, :website, :url
  end
end
