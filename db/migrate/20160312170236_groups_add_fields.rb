class GroupsAddFields < ActiveRecord::Migration
  def change
    add_column :groups, :profile, :string
    create_join_table :teachers, :subjects
  end
end
