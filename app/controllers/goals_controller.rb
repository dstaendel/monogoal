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
    @goal.save

    # if @goal.save
    #   redirect_to ?????????_path, notice: "Your goal was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end
end
