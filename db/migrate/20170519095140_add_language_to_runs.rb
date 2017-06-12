class AddLanguageToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :runs, :language, foreign_key: true
  end
end
