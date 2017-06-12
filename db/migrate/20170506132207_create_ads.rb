class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.references :company, foreign_key: true
      t.references :run, foreign_key: true

      t.timestamps
    end
  end
end
