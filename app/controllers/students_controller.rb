class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Înregistrarea a fost adaugată cu succes'
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Înregistrarea a fost actualizată cu succes"
      redirect_to @student
    else
      render 'edit'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    flash[:notice] = "Înregistrarea a fost ștearsă"
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthday, :phone, :idnp, :subject_id, :group_id, :email, :p_first_name, :p_last_name, :p_phone, :p_email)
  end
end
