class LinkGroupsToSubjects < ActiveRecord::Migration
  def change
    add_column :group_subjects, :subjects_teacher_id, :integer
    add_reference :group_subjects, :subjects_teachers, index: true, foreign_key: true
  end
end
