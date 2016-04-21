class GradesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @grades = @student.grades
    @table = Hash.new
    @student.group.years.each do |year|
      @table[year] = @student.grades_for_year(year)
    end
  end
  def new
    @student = Student.find(params[:student_id])
  end
  def create
    grade = Grade.find(params[:id])
    grade.value = params[:value].to_f
    if grade.valid?
      grade.save
      render :text=>params[:value]
    else
      render :text=>''
    end
  end
end
