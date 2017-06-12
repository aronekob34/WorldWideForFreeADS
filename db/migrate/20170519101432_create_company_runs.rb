class CreateCompanyRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :company_runs do |t|
      t.integer :run_id
      t.integer :company_id
      t.integer :printnumber

      t.timestamps
    end
  end
end
