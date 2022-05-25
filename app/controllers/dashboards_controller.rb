class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.new(current_user)
    authorize @dashboard # Wahts the class of this thing? Dashboard. Give me DashboardPolicy. show?
  end
end
