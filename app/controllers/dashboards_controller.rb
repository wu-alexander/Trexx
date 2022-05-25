class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.new(current_user)
    authorize @dashboard
  end
end
