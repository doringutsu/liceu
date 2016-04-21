# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  idnp         :string
#  birthday     :date
#  email        :string
#  phone        :string
#  p_first_name :string
#  p_last_name  :string
#  p_phone      :string
#  p_email      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject_id   :integer
#  group_id     :integer
#

class Student < ActiveRecord::Base
  belongs_to :subject
  belongs_to :group
  has_many :grades, :dependent => :destroy
  accepts_nested_attributes_for :grades
  validates :first_name, :last_name, :p_last_name, :p_first_name, presence: true,
                      length: { minimum: 3, maximum: 25 }
  validates :phone, :p_phone, length: { minimum: 12 }, allow_blank: true
  validates :email, :p_email, length: { minimum: 5, maximum: 25 }, allow_blank: true
  validates :subject, :birthday, :subject, :group, presence: true
  validates :idnp, length: { minimum: 13, maximum: 13 }, presence: true
  validates :birthday, presence: true
  validates_format_of :birthday, :with => /\d{4}-\d{2}-\d{2}/, message: "Data are formatul aaaa-ll-zz"
  validates_format_of :email, :p_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: true
  validates_format_of :first_name, :last_name, :p_first_name, :p_last_name, :with => /\A[A-Z|a-z|ă|â|î|ș|ț|Ț|Ș]+\z/, message: "Numele poate conține doar litere"

  def full_name
    "#{last_name} #{first_name}"
  end

  def subjects
    subjects = Subject.where('genre=? or id=?', 'b', subject_id)
  end

  def subjects_for_year(year)
    subjects = Subject.where('(genre=? or id=?) and ? between start_year and finish_year', 'b', subject_id, year)
  end

  def studying_year(grade)
    group.year + grade - 1
  end

  def grades_for_year(year)
    hash = Hash.new
    subjects_for_year(year).each do |subject|
      hash[subject.name] = [
        Grade.get(id, subject.id, year, 1, 's'),
        Grade.get(id, subject.id, year, 2, 's'),
      ]
      if year >= 10
        hash[subject.name].insert(1, Grade.get_or_nil(id, subject, year, 1, 't', group.profile))
        hash[subject.name].insert(3, Grade.get_or_nil(id, subject, year, 2, 't', group.profile))
      end
    end
    hash
  end
end
