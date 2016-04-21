class SubjectsAddFinishYear < ActiveRecord::Migration
  def change
    change_column_default :subjects, :type, 'b'
    change_column_default :subjects, :start_year, 1
    add_column :subjects, :finish_year, :integer, {default: 12}
  end
end
