class TasksController < ApplicationController
  before_action :set_goal, only: %i[index create edit]
  before_action :set_task, only: %i[edit update destroy mark_as_done]

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

  def mark_as_done
    if task.update(is_done: true)
      update_goal_completion(task.goal_id)
      redirect_to tasks_path, notice: "Task marked as done successfully."
    else
      redirect_to tasks_path, alert: "Failed to mark task as done."
    end
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

  def update_goal_completion(goal_id)
    goal = Goal.find(goal_id)
    total_tasks = goal.tasks.count
    completed_tasks = goal.tasks.where(is_done: true).count

    new_completion_pct = (completed_tasks.to_f / total_tasks) * 100
    # Ensure the tree does not regress
    # current_completion_pct not defined yet
    if new_completion_pct >= goal.current_completion_pct
      # completion_image not defined yet
      goal.update(completion_image: determine_tree_img(new_completion_pct), current_completion_pct: new_completion_pct)
    end
  end

  def determine_tree_img(completion_pct)
    case completion_pct
    when 0...10
      "tree_seed.png"
    when 10...20
      "tree_small.png"
    when 20...30
      "tree_md_small.png"
    when 30...40
      "tree_medium.png"
    when 40...50
      "tree_grows.png"
    when 50..100
      "tree_fully_grown.png"
    else
      "tree_died.png"
    end
  end
end
