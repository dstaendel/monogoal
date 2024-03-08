module ApplicationHelper

  def time_based_greeting
    current_hour = Time.current.hour

    if current_hour < 12
      "Good morning"
    elsif current_hour < 18
      "Have a good day"
    elsif current_hour < 22
      "Good evening"
    else
      "Have a good night"
    end
  end

  def time_based_emoji
    current_hour = Time.current.hour

    if current_hour < 12
      "🌅"
    elsif current_hour < 18
      "☀️"
    elsif current_hour < 22
      "🌅"
    else
      "🌚"
    end
  end

end
