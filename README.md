# TimeDuration

[![Gem Version](https://img.shields.io/gem/v/time-duration)](https://rubygems.org/gems/time-duration)
[![Test](https://github.com/d-mato/time_duration/actions/workflows/test.yml/badge.svg)](https://github.com/d-mato/time_duration/actions/workflows/test.yml)

Lengths of time, as opposed to clock times. Hours are never wrapped around a day, so fifty hours stays `50:00`.

## Installation

```ruby
gem 'time-duration'
```

## Usage

### Parsing

```ruby
TimeDuration.parse('1:10')   # => 1:10
TimeDuration.parse('1:70')   # => 2:10
TimeDuration.parse('-1:30')  # => -1:30
```

### Building

```ruby
TimeDuration::Duration.new                       # => 0:00
TimeDuration::Duration.new(minute: 10)           # => 0:10
TimeDuration::Duration.new(hour: 1, minute: 10)  # => 1:10
```

Shorthands for a single unit:

```ruby
TimeDuration.hour(8)     # => 8:00
TimeDuration.minute(8)   # => 0:08
TimeDuration.second(90)  # => 0:01
```

### Arithmetic

```ruby
TimeDuration.parse('0:40') + TimeDuration.parse('0:30')   # => 1:10
TimeDuration.parse('0:40') - TimeDuration.parse('0:30')   # => 0:10
TimeDuration.parse('0:00') - TimeDuration.parse('0:01')   # => -0:01
TimeDuration.parse('50:00') + TimeDuration.parse('50:00') # => 100:00
```

### Comparison

```ruby
TimeDuration.parse('0:40') > TimeDuration.parse('0:30')   # => true
TimeDuration.parse('0:60') == TimeDuration.parse('1:00')  # => true
```

Durations that compare equal are also equal as hash keys:

```ruby
[TimeDuration.parse('0:60'), TimeDuration.parse('1:00')].uniq.size  # => 1
```

## Development

Run `bin/setup` to install dependencies, `bundle exec rake` to run the specs and RuboCop, and `bin/console` for an IRB session with the gem loaded.

## Releasing

Run the [Release workflow](https://github.com/d-mato/time_duration/actions/workflows/release.yml) and choose a version bump. It tags the version, drafts the release notes, and publishes to RubyGems.org through trusted publishing.

## Contributing

Bug reports and pull requests are welcome at https://github.com/d-mato/time_duration.

## License

Released under the [MIT License](LICENSE.txt).
