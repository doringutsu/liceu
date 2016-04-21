class UnlinkTeachersSubjects < ActiveRecord::Migration
  def change
    remove_reference :teachers, :subject
  end
end
