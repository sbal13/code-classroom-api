class AddCohortIdToRoom < ActiveRecord::Migration[5.2]
  def change
    change_table :rooms do |t|
      t.belongs_to :cohort
    end
  end
end
