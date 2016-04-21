class ChangeSessionYearType < ActiveRecord::Migration
  def change
    change_column :sessions, :year, 'integer USING CAST(year AS integer)'
  end
end
