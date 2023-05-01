# Module Dtd provides methods for calculating the difference between two dates.
module Dtd
  # The current version of the Dtd module.
  VERSION = "0.1.0"

  # <h3>Calculates the difference between two dates in days, months, and years.</h3>
  #
  # &nbsp;&nbsp;&nbsp;&nbsp;date1     - The first date in the format YYYY/MM/DD (String).
  # 
  # &nbsp;&nbsp;&nbsp;&nbsp;date2     - The second date in the format YYYY/MM/DD (String).
  # 
  # &nbsp;&nbsp;&nbsp;&nbsp;time_zone - The time zone in which the dates are specified (String, default: "UTC").
  #
  # <b>Examples:</b>
  #
  #   &nbsp;&nbsp;&nbsp;Dtd.date_diff("2022/04/30", "2022/05/01")
  #   &nbsp;&nbsp;=> {"years" => 0, "months" => 0, "days" => 1}
  #
  # Returns a Hash containing the difference in years, months, and days, or an error Hash.</br>
  # &nbsp;If the difference is positive, the Hash contains the keys "years", "months", and "days"
  # with their respective integer values.</br> &nbsp;If date2 is before date1, the Hash contains the key
  # "error" with the value "Date 2 is before date 1.".</br> &nbsp;If the difference is 0, the Hash
  # contains the keys "years", "months", and "days" with the value 0 for each.
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
end 
