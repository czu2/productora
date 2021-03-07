class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @last_month_concerts = Concert.last_concerts(@group)
    @max_audience = Concert.max_audience(@group)
    @max_duration = Concert.max_duration(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)

    if @group.save
      redirect_to groups_path, notice: "Grupo Registrado!!"
    else
      redirect_to groups_path, alert: "El grupo no se pudo registrar"
    end

  end

  def edit
  end

  def update
    @group.update(groups_params)
    redirect_to groups_path, notice: "Grupo editado"
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private
    def groups_params
      params.require(:group).permit(:name, :members, :debut, :team)
    end

    def set_group
      @group = Group.find(params[:id])
    end
end
