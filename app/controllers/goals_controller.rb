class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    unless current_user.goals.exists?(active: true)
      @goal.active = true
      redirect_to root_path, notice: "Your goal was successfully created."
    end

    if @goal.save
      redirect_to archive_path, notice: "Your goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit_date
    @goal = Goal.find_by(active: true, user_id: current_user)
  end

  def update
    if params[:active] == true
      goals = Goal.find_by(active: true, user_id: current_user)
      goals.each do |goal|
        goal.active = false
        goal.save
      end
    end

    @goal = Goal.find(params[:id])
    time_range = params["goal"]["start_time"]
    dates = time_range.split(" to ")
    @goal.start_time = dates.first
    @goal.end_time = dates.last
    @goal.update!(goal_params)
    redirect_to root_path(seconds: params[:goal][:seconds], running: params[:goal][:running])
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :active, :start_time, :end_time, :emoji)
  end
end
