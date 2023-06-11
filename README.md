# dtd

This module provides a convenient way to calculate the difference between two dates in days, months, and years. It also offers the ability to calculate the difference between two times in hours, minutes, and seconds. It offers a simple and effective solution for performing date and time calculations in Crystal applications.

## Installation

1. Add the `dtd` dependency to your `shard.yml` file:

   ```yaml
   dependencies:
     dtd:
       github: danielcoderx/dtd
   ```

2. Run `shards install` to fetch the dependency.

## Usage

### Date Difference

```crystal
require "dtd"

date1 = "2022/04/30"
date2 = "2022/05/01"

result = Dtd.date_diff(date1, date2)

puts "Difference: #{result["years"]} years, #{result["months"]} months, #{result["days"]} days"
```

### Time Difference

```crystal
require "dtd"

time1 = "2022/05/01 10:30:00"
time2 = "2022/05/01 12:45:30"

result = Dtd.time_diff(time1, time2)

puts "Difference: #{result["hours"]} hours, #{result["minutes"]} minutes, #{result["seconds"]} seconds"
```

## Features

- Calculates the difference between two dates in days, months, and years.
- Calculates the difference between two times in hours, minutes, and seconds.
- Supports custom time zones for accurate calculations.
- Returns a Hash that provides the difference in years, months, days, hours, minutes, and seconds.
- Handles scenarios where the second date or time is before the first date or time.
- Provides error messages when necessary.

## TODO

- Enhance error handling and error messages.
- Add support for accepting various input formats.
- Improve overall performance and efficiency.

## Contributing

1. Fork the repository from [https://github.com/danielcoderx/dtd](https://github.com/danielcoderx/dtd).
2. Create your feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push the branch to your forked repository: `git push origin my-new-feature`.
5. Create a new Pull Request.

## Contributors

- [danielcoderx](https://github.com/danielcoderx) - Creator and maintainer

Your contributions to this project are highly appreciated! If you have any suggestions, bug reports, or feature requests, please don't hesitate to open an issue or submit a pull request. Let's work together to make `dtd` even better!