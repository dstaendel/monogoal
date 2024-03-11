module ApplicationHelper

  def time_based_greeting
    current_hour = Time.current.in_time_zone("Berlin").hour

    if current_hour < 12
      "Good Morning, "
    elsif current_hour < 18
      "Good Day, "
    elsif current_hour < 22
      "Good Evening, "
    else
      "Good Night, "
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
      "🌙"
    end
  end

end
