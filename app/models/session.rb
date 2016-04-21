class Session < ActiveRecord::Base
  def self.current_study_year
    Date.today.month > 8 ? Date.today.year : Date.today.year-1
  end
  has_many :theses
  validates :year, presence: true, :numericality => { :less_than_or_equal_to => Session.current_study_year }
  validates :theses, presence: true
  validates_uniqueness_of :year, :message => 'Sesiunea pentru anul %{value} deja există'
end
