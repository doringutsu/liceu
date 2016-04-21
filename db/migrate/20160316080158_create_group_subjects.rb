class CreateGroupSubjects < ActiveRecord::Migration
  def change
    create_table :group_subjects do |t|
      t.timestamps null: false

    end
  end
end
