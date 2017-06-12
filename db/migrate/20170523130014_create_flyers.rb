class CreateFlyers < ActiveRecord::Migration[5.0]
  def change
    create_table :flyers do |t|
      t.integer :company_id
      t.integer :language_id
      t.string :flyer

      t.timestamps
    end
  end
end
