class AddCompletionImageToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :completion_image, :string
  end
end
