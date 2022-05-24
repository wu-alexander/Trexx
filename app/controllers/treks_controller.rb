class TreksController < ApplicationController
  def index
    @treks = policy_scope(Trek)
  end

  def show
    @trek = Trek.find(params[:id])
    authorize @trek
  end

  def new
    @trek = Trek.new
    authorize @trek
  end

  def create
    @trek = Trek.new(trek_params)
    @trek.user = current_user
    authorize @trek

    if @trek.save
      redirect_to @trek, notice: "Your trek was successfully created"
    else
      render :new
    end
  end

  private

  def trek_params
    params.require(:trek).permit(:start_location, :difficulty, :duration_days, :description)
  end
end
