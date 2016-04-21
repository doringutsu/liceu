class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :year, null: false
      t.string :letter, limit: 1, null: false
      t.timestamps null: false
    end
    add_reference :groups, :teacher, index: true, foreign_key: true
  end
end
