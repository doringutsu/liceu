class GroupsController < ApplicationController
    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            flash[:notice] = "Înregistrarea a fost adaugată cu succes"
            redirect_to @group
        else
          render 'new'
        end
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
        @group = Group.find(params[:id])
    end

    def index
        @groups = Group.all
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
          flash[:notice] = "Înregistrarea a fost actualizată cu succes"
          redirect_to @group
        else
          render 'edit'
        end
    end

    def destroy
        group = Group.find(params[:id])
        group.destroy
        flash[:notice] = "Înregistrarea a fost ștearsă"
        redirect_to groups_path
      end

    private
    def group_params
        params.require(:group).permit(:year, :letter, :teacher_id, :profile)
    end
end
