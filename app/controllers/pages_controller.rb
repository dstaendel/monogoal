class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @goal = Goal.where(active: true, user_id: current_user).first
    unless @goal.nil?
      @tasks = Task.where(goal_id: @goal.id)
      @tasks = Task.order("done ASC, created_at ASC")
      @quote = ZenQuotesService.fetch_random_quote
    end
  end

  def pomodoro

  end
end
