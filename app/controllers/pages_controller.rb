class PagesController < ApplicationController
  def home
    @nearby_treks = Trek.first(3)
  end
end
