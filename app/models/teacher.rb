# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  birthday   :date
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ActiveRecord::Base
    has_and_belongs_to_many :subjects, :through => :subjects
    before_destroy { subjects.clear }
    has_many :groups
    validates :first_name, presence: true,
                        length: { minimum: 3, maximum: 25 }
    validates :last_name, presence: true,
                        length: { minimum: 3, maximum: 25 }
    validates :phone, length: { minimum: 12 }

    validates :subjects, presence: true
    validates :birthday, presence: true
    validates_format_of :first_name, :with => /[A-Z|a-z|ă|â|î|ș|ț|Ț|Ș]/
    validates_format_of :last_name, :with => /[A-Z|a-z|ă|â|î|ș|ț|Ț|Ș]/

    def full_name
        [last_name, first_name].join(' ')
    end

    def show_subjects
        subjects.map {|t| t.name}.join(', ')
    end
end
