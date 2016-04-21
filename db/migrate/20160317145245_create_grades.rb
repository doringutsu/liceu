class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
        t.float :value
        t.integer :year
        t.integer :semester
        t.string :type
    end
    change_column_default :grades, :type, 's'
  end
end
