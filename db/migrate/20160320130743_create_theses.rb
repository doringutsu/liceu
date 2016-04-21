class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.integer :year
      t.integer :grade
      t.timestamps null: false
    end
    create_join_table :theses, :subjects
  end
end
