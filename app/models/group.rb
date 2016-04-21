# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  letter     :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :integer
#  profile    :string
#

class Group < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  has_many :group_subjects
  validates :year, presence: true
  validates :letter, presence: true,
                      length: { minimum: 1, maximum: 1 }
  validates :teacher_id, presence: true

  def finished?
    curr_year > 12
  end

  def curr_year
    result = Date.today.year - year if year
    Date.today.month > 8 ? result -1 : result
  end

  def status
    if finished?
      return '12 (absolvenți)'
    else
      return curr_year
    end
  end

  def finish_year
    year + 11
  end

  def display
    if finished?
      return "12 #{letter} (#{finish_year})"
    else
      return "#{curr_year} #{letter}"
    end
  end

  def years
    return [] if curr_year.nil?
    last_year = curr_year > 12 ? 12 : curr_year
    (1..last_year).to_a
  end

  def theses
    Thesis.where('profile=? and
      ((year=? and grade=10) or (year=? and grade=11) or (year=? and grade=12))',
      profile, studying_year(10), studying_year(11), studying_year(12)
    )
  end
  def studying_year(grade)
    year + grade - 1
  end
end
