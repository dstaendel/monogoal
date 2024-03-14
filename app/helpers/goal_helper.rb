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
      "tree_home.svg"
    else
      "SEED.png"
    end
  end

  def date_messages(remaining_days)
    if remaining_days.zero?
      "Today is the day."
    elsif remaining_days == 1
      "One day 'til goal completion."
    elsif remaining_days >= 2 && remaining_days <= 365
      "Remaining days: #{@goal.remaining_days}"
    elsif remaining_days >= 365
      "Over a year to go ..."
    elsif remaining_days.negative?
      "Your set date is in the past ..."
    else
      "Something went wrong ..."
    end
  end
end
