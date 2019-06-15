# TimeDuration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time-duration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time-duration

## Usage



### Parser

```ruby
duration = TimeDuration.parse('1:10')
duration.to_s # => "1:10"

duration = TimeDuration.parse('1:70')
duration.to_s # => "2:10"
```

### Initializer

```ruby
TimeDuration::Duration.new # => 0:00
TimeDuration::Duration.new(minute: 10) # => 0:10
TimeDuration::Duration.new(hour: 1) # => 1:00
TimeDuration::Duration.new(hour: 1, minute: 10) # => 1:10
```

#### Shorthands
```ruby
TimeDuration.hour(8) # => 8:00
TimeDuration.minute(8) # => 0:08
```

### Operations

```ruby
duration = TimeDuration.parse('0:40') + TimeDuration.parse('0:30')
duration.to_s # => "1:10"

duration = TimeDuration.parse('0:40') - TimeDuration.parse('0:30')
duration.to_s # => "0:10"
```

### Comparisons

```ruby
TimeDuration.parse('0:40') > TimeDuration.parse('0:30') # => true

TimeDuration.parse('0:60') == TimeDuration.parse('1:00') # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/time_duration.
