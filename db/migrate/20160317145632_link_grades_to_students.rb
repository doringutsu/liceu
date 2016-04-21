class LinkGradesToStudents < ActiveRecord::Migration
  def change
    add_reference :grades, :student, index: true, foreign_key: true
  end
end
