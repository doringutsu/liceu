class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :year
      t.string :integer
    end
  end
end
