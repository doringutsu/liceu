class LinkGradeToSubject < ActiveRecord::Migration
  def change
    add_reference :grades, :subject, index: true, foreign_key: true
  end
end
