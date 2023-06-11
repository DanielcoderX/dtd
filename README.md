# dtd

This module provides a convenient way to calculate the difference between two dates in days, months, and years. It offers a simple and effective solution for performing date calculations in Crystal applications.

## Installation

1. Add the `dtd` dependency to your `shard.yml` file:

   ```yaml
   dependencies:
     dtd:
       github: danielcoderx/dtd
   ```

2. Run `shards install` to fetch the dependency.

## Usage

```crystal
require "dtd"

date1 = "2022/04/30"
date2 = "2022/05/01"

result = Dtd.date_diff(date1, date2)

puts "Difference: #{result["years"]} years, #{result["months"]} months, #{result["days"]} days"
```

## Features

- Calculates the difference between two dates in days, months, and years.
- Supports custom time zones for accurate calculations.
- Returns a Hash that provides the difference in years, months, and days.
- Handles scenarios where the second date is before the first date.
- Provides an error message when necessary.

## TODO

- Enhance error handling and error messages.
- Add support for accepting various input formats.
- Extend functionality to calculate time differences.

## Contributing

1. Fork the repository from [https://github.com/danielcoderx/dtd](https://github.com/danielcoderx/dtd).
2. Create your feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push the branch to your forked repository: `git push origin my-new-feature`.
5. Create a new Pull Request.

## Contributors

- [danielcoderx](https://github.com/danielcoderx) - Creator and maintainer

Your contributions to this project are highly appreciated! If you have any suggestions, bug reports, or feature requests, please don't hesitate to open an issue or submit a pull request. Let's work together to make `dtd` even better!