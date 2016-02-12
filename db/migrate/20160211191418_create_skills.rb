class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :description
      t.string :description
      t.references :profile, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
