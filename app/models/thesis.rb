class Thesis < ActiveRecord::Base
  belongs_to :session
  has_and_belongs_to_many :subjects, :through => :subjects
  validates :subjects, presence: true, length: { minimum: 2, maximum: 4 }
  accepts_nested_attributes_for :session

  def show_profile
    profile == 'r' ? 'real' : 'uman'
  end

  def exclude_foreign_languages
    if not (foreign_subjects & subjects).empty?
      foreign_subjects.each { |subject| subjects.delete(subject) }
      subjects << default_foreign_subject
    end
  end

  def exclude_foreign_language
    if subjects.include? default_foreign_subject

    end
  end

  def foreign_subjects
    Subject.where('genre=?', 'f')
  end

  def year
    session.year
  end
end
