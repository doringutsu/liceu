class RenameGradesType < ActiveRecord::Migration
  def change
    rename_column :grades, :type, :genre
  end
end
