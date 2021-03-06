class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @trip = Trip.new
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.nil?
      head :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    result = @passenger.update(passenger_params)

    if result
      redirect_to passenger_path(@passenger.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    passenger.destroy
    redirect_to passengers_path
  end


  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end

end
