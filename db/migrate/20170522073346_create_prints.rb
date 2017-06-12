class CreatePrints < ActiveRecord::Migration[5.0]
  def change
    create_table :prints do |t|
      t.integer :run_id
      t.integer :company_number
      t.integer :print

      t.timestamps
    end
  end
end
