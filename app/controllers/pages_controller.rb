class PagesController < ApplicationController
  def home
  end

  def dashboard
    @goal = Goal.find(params[:id])
  end
end
