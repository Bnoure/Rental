class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cars = Car.where.not(user: current_user).order("created_at").limit(3)
  end
end
