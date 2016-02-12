class CreateOverview < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :description
      t.references :profile, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
