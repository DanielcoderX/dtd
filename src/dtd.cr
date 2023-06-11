# Module Dtd provides methods for calculating the difference between two dates.
module Dtd
  # The current version of the Dtd module.
  VERSION = "0.1.0"

  # Calculates the difference between two dates in days, months, and years.
  #
  # date1     - The first date in the format YYYY/MM/DD (String).
  # date2     - The second date in the format YYYY/MM/DD (String).
  # time_zone - The time zone in which the dates are specified (String, default: "UTC").
  #
  # Examples:
  #   Dtd.date_diff("2022/04/30", "2022/05/01")
  #   => {"years" => 0, "months" => 0, "days" => 1}
  #
  # Returns a Hash containing the difference in years, months, and days, or an error Hash.
  # If the difference is positive, the Hash contains the keys "years", "months", and "days"
  # with their respective integer values.
  # If date2 is before date1, the Hash contains the key "error" with the value "Date 2 is before date 1."
  # If the difference is 0, the Hash contains the keys "years", "months", and "days" with the value 0 for each.
  def self.date_diff(date1 : String, date2 : String, time_zone : String = "UTC") : Hash(String, Int32) | Hash(String, String)
    # Load the specified time zone.
    time_zone = Time::Location.load(time_zone)
    
    # Parse date1 and date2 and set the time zone.
    date1_time = Time.parse(date1, "%Y/%m/%d", time_zone)
    date2_time = Time.parse(date2, "%Y/%m/%d", time_zone)
    
    # Calculate the difference in days.
    days_diff = (date2_time - date1_time) / 86_400.seconds
    
    # If days_diff is 0, create a Hash with all values set to 0.
    if days_diff.zero?
      {"years" => 0, "months" => 0, "days" => 0}
    # If days_diff is negative, create an error Hash.
    elsif days_diff < 0
      {"error" => "Date 2 is before date 1."}
    else
      # Calculate the difference in years, months, and days.
      years = (days_diff / 365.25).to_i
      days_diff %= 365.25
      months = (days_diff / 30.44).to_i
      days = (days_diff % 30.44).to_i
      
      # Create a Hash containing the difference in years, months, and days.
      {"years" => years, "months" => months, "days" => days}
    end
  end

  # Calculates the difference between two times in hours, minutes, and seconds.
  #
  # time1     - The first time in the format YYYY/MM/DD HH:MM:SS (String).
  # time2     - The second time in the format YYYY/MM/DD HH:MM:SS (String).
  # time_zone - The time zone in which the times are specified (String, default: "UTC").
  #
  # Examples:
  #   Dtd.time_diff("2022/01/01 08:45:00", "2022/01/01 11:30:15")
  #   => {"hours" => 2, "minutes" => 45, "seconds" => 15}
  #
  # Returns a Hash containing the difference in hours, minutes, and seconds, or an error Hash.
  # If the difference is positive, the Hash contains the keys "hours", "minutes", and "seconds"
  # with their respective integer values.
  # If time2 is before time1, the Hash contains the key "error" with the value "Time 2 is before time 1."
  # If the difference is 0, the Hash contains the keys "hours", "minutes", and "seconds" with the value 0 for each.
  def self.time_diff(time1 : String, time2 : String, time_zone : String = "UTC") : (Hash(String, Int32 | Int64) | Hash(String, Int32) | Hash(String, String))
    time_zone = Time::Location.load(time_zone)
    
    time1_time = Time.parse(time1, "%Y/%m/%d %H:%M:%S", time_zone)
    time2_time = Time.parse(time2, "%Y/%m/%d %H:%M:%S", time_zone)
    
    seconds_diff = (time2_time - time1_time).to_i
    
    if seconds_diff.zero?
      {"hours" => 0, "minutes" => 0, "seconds" => 0}
    elsif seconds_diff < 0
      {"error" => "Time 2 is before time 1."}
    else
      hours = (seconds_diff / 3600).to_i
      seconds_diff %= 3600
      minutes = (seconds_diff / 60).to_i
      seconds = seconds_diff % 60
      
      {"hours" => hours, "minutes" => minutes, "seconds" => seconds}
    end
  end
end 