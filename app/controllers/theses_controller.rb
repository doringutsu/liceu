class ThesesController < ApplicationController
  def index
    @theses = Thesis.all
  end

  def new
    @session = [10, 11, 12].map { |grade| ['r', 'u'].map { |profile| thesis = Thesis.new; thesis.grade = grade; thesis.profile = profile; thesis}}
  end

  def create
    year = params[:thesis][:year]
    theses = params[:thesis][:theses]
    @session = []
    theses.each do |t|
        dict = t.clone
        subjects = dict[:subjects].clone
        dict[:year] = year
        subjects.map! { |t| Subject.find(t) if not t.empty?}.compact!
        dict[:subjects] = subjects
        @session << Thesis.new(dict)
    end
  end
end
