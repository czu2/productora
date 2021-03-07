class ConcertsController < ApplicationController

  def index
    @concerts = Concert.all
  end

  def new
    @concert = Concert.new
    @groups = Group.all
  end

  def create
    @concert =  Concert.new(concert_params)

    if @concert.save
      redirect_to root_path, notice: "Concierto Registrado!!"
    else
      redirect_to root_path, alert: "El concierto no se pudo registrar"
    end

  end

  def edit
    @concert = Concert.find(params[:id])
    @groups = Group.all
  end

  def update
    @concert = Concert.find(params[:id])
    @concert.update(concert_params)
    redirect_to root_path
  end
  
  private
    def concert_params
      params.require(:concert).permit(:name, :duration, :audience, :event_date, :group_id)
    end
    
end
