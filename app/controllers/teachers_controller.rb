class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    @teacher.birthday = Date.today
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = "Înregistrarea a fost adaugată cu succes"
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:notice] = "Înregistrarea a fost actualizată cu succes"
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])

    if @teacher.groups.empty?
      @teacher.destroy
      flash[:notice] = "Înregistrarea a fost ștearsă"
      redirect_to teachers_path
    else
      @groups = @teacher.groups
      render 'show'
    end
  end

  private
  def teacher_params
    p = params.require(:teacher).permit(:first_name, :last_name, :birthday, :phone, :subjects => [])
    p[:subjects].map! { |t| Subject.find(t) if not t.empty?}.compact!
    p
  end
end
