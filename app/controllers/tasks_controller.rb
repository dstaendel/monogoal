class TasksController < ApplicationController
  before_action :set_goal, only: %i[index create edit]
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.order("created_at ASC")
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.goal = @goal
    @task.save
    redirect_to goal_tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to goal_tasks_path(@task.goal.id)
  end

  def destroy
    @task.destroy
    redirect_to goal_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :percentage)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
