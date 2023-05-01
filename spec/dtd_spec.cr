require "./spec_helper"

describe Dtd do
  describe ".date_diff" do
    it "returns a hash with difference between two dates" do
      result = Dtd.date_diff("2022/05/05", "2024/05/25")
      result.should eq({"years" => 2, "months" => 0, "days" => 20})
    end

    it "handles time zone correctly" do
      result = Dtd.date_diff("2022/05/15", "2024/03/25", "America/New_York")
      result.should eq({"years" => 1, "months" => 10, "days" => 10})
    end

    it "returns error message when date2 is before date1" do
      result = Dtd.date_diff("2024/05/25", "2022/05/05")
      result.should eq({"error" => "Date 2 is before date 1."})
    end

    it "returns a hash with all zero values when dates are the same" do
      result = Dtd.date_diff("2022/05/05", "2022/05/05")
      result.should eq({"years" => 0, "months" => 0, "days" => 0})
    end
  end
end
