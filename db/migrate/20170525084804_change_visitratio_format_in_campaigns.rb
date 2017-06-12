class ChangeVisitratioFormatInCampaigns < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
  		change_table :campaigns do |t|
  			dir.up { t.change :visitratio, :decimal, :precision => 5, :scale => 4, :default => 1 }
  			dir.down { t.change :visitratio, :integer }
  		end
  	end
  end
end
