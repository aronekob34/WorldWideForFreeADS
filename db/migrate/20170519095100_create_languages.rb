class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :iso
      t.string :name

      t.timestamps
    end
  end
end
