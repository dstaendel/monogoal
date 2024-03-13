module GoalHelper
  def image_progress(progress)
    case progress
    when 0
      "SEED.png"
    when 0.1..24.99
      "PLANT-1.png"
    when 25..49.99
      "PLANT-2.png"
    when 50..74.99
      "PLANT-3.png"
    when 75..99.99
      "PLANT-4.png"
      # Should have the celebration animation. Needs to be activated by user:
    when 100
      "PLANT-4.png"
    else
      "tree_home.svg"
    end
  end

  def date_messages(remaining_days)
    case remaining_days
    when 0
      "Today is the day."
    when 1
      "One day 'til goal completion."
    when 2..365
      "Remaining days: #{@goal.remaining_days}"
    # when >= 366
    #   "Over a year to go ..."
    # when negative?
    #  "Your set date is in the past ..."
    else
      "Something went wrong ..."
    end
  end
end
