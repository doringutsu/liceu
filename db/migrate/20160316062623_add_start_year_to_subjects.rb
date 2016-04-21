class AddStartYearToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :start_year, :integer
  end
end
