# dtd

This module contains a method to calculate the difference between two dates in days, months, and years.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     dtd:
       github: danielcoderx/dtd
   ```

2. Run `shards install`

## Usage

```crystal
require "dtd"
date1 = "2022/04/30"
date2 = "2022/05/01"
result = Dtd.date_diff(date1, date2)

puts "Difference: \#{result["years"]} years, \#{result["months"]} months, \#{result["days"]} days"
```

## TODO
- Add time difference 
- You can say :) just open an issue

## Contributing

1. Fork it (<https://github.com/danielcoderx/dtd/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [danielcoderx](https://github.com/danielcoderx) - creator and maintainer