# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_year :integer
#

class Subject < ActiveRecord::Base
  belongs_to :teachers
  belongs_to :theses
  has_many :students
  has_many :grades

  def years_range
    (start_year..finish_year)
  end

  def self.for_year(year)
    Subject.where('? between start_year and finish_year', year)
  end

  def self.for_thesis_year(year)
    Subject.where('? between start_year and finish_year and genre=?', year, 'b')
  end
end
