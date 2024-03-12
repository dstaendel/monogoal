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

    @task.percentage = calculate_task_percentage
    @task.save!

    update_goal_progress
    redirect_to goal_tasks_path
  end

  def edit
  end

  def update
    mark_as_done
    @task.save
    update_goal_progress
    p params
    # redirect_to goal_tasks_path(@task.goal.id)
  end

  def destroy
    @task.destroy
    redirect_to goal_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def calculate_task_percentage
    goal = @task.goal
    total_tasks = goal.tasks.count
    completed_tasks = goal.tasks.where(done: true).count
    (completed_tasks.to_f / total_tasks) * 100
  end

  def update_goal_progress
    goal = @task.goal

    goal.progress = calculate_task_percentage
    goal.save!
  end

  def mark_as_done
    @task.update(task_params) unless params[:task][:done] == "check"

    if params[:task][:done] == "check"
      if @task.done == true
        @task.done = false
      else
        @task.done = true
      end
    end
  end
end
