class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @trek = Trek.find(params[:trek_id])
    @trek_host = @trek.user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.trek = Trek.find(params[:trek_id])
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking successful"
    else
      render :new
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :num_trekkers)
  end
end
