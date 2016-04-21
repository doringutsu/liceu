class AddSubjectToTeachers < ActiveRecord::Migration
  def change
    add_reference :teachers, :subject, index: true, foreign_key: true
  end
end
