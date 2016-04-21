class AddYearToGroupSubject < ActiveRecord::Migration
  def change
    add_column :group_subjects, :year, :integer
  end
end
