class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_study_year
    Date.today.month > 8 ? Date.today.year : Date.today.year-1
  end
end
