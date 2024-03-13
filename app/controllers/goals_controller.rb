class GoalsController < ApplicationController

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.active = true

    if @goal.save
      redirect_to root_path, notice: "Your goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit_date
    @goal = Goal.find(params[:id])
  end

  def update
    if params[:active] == true
      goals = Goal.where(active: true, user_id: current_user)
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
    redirect_to root_path
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :active, :start_time, :end_time, :emoji)
  end
end
