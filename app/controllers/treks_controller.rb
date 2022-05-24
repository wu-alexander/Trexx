class TreksController < ApplicationController
  before_action :set_trek, only: [ :show, :edit, :update, :destroy ]

  def index
    @treks = policy_scope(Trek)
  end

  def show
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
      redirect_to @trek, notice: "Your trek has been created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trek.update(trek_params)
      redirect_to @trek, notice: "Your trek has been updated"
    else
      render :edit
    end
  end

  def destroy
    @trek.destroy
    redirect_to treks_path, notice: "Your trek has been deleted"
  end

  private

  def set_trek
    @trek = Trek.find(params[:id])
    authorize @trek
  end

  def trek_params
    params.require(:trek).permit(:start_location, :difficulty, :duration_days, :description, :name, :price)
  end
end
