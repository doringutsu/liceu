# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  value      :float
#  year       :integer
#  semester   :integer
#  type       :string           default("s")
#  student_id :integer
#

class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject

  validates_numericality_of :value, less_than_or_equal_to: 10, greater_than_or_equal_to: 2, :on => :save

  def self.get(student_id, subject_id, year, semester, genre)
    Grade.where(student_id: student_id, subject_id: subject_id, year: year, semester: semester, genre: genre).first_or_create
  end

  def self.get_or_nil(student_id, subject, year, semester, genre, profile)
    study_year = Student.find(student_id).studying_year(year)
    thesis = Thesis.where(year: study_year, grade: year, semester: semester, profile: profile)
    if thesis.empty? or not thesis.first.subjects.include? subject
        return
    else
        Grade.get(student_id, subject.id, year, semester, genre)
    end
  end
end
