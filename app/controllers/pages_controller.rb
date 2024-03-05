class PagesController < ApplicationController
  def home
  end

  def dashboard
    @goal = Goal.where(active: true, user_id: current_user).first
  end
end
