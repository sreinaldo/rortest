class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institution
      t.string :degree
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :profile, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
