class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
    @session.theses = [10, 11, 12].map do |grade|
      ['r', 'u'].map do |profile|
        [1, 2].map do |semester|
          thesis = Thesis.new
          thesis.grade = grade
          thesis.profile = profile
          thesis.semester = semester
          thesis
        end
      end
    end.flatten
  end

  def create
    @session = Session.new(session_params)
    all_params[:theses].each do |dict|
      t_dict = thesis_params(dict)
      t_dict[:year] = session_params[:year]
      @session.theses.build(t_dict)
    end
    if @session.valid?
      @session.save
      flash[:notice] = "Sesiunea a fost adăugată cu succes"
      redirect_to sessions_path
    else
      render 'new'
    end
  end

  private
  def all_params
    params.require(:session)
  end

  def session_params
    params.require(:session).permit(:year)
  end

  def thesis_params(thesis)
    dict = thesis.permit(:profile, :grade, :semester, :subjects => [])
    add_subjects = []
    dict[:subjects].map! { |t| Subject.find(t) if not t.empty?}.compact!
    dict[:subjects] += add_subjects
    dict
  end
end
