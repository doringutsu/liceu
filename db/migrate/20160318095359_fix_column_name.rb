class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :subjects, :type, :genre
  end
end
