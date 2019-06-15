require 'time_duration/version'
require 'time_duration/duration'

module TimeDuration
  def self.parse(args)
    Duration.parse(args)
  end

  def self.hour(hour)
    Duration.new(hour: hour)
  end

  def self.minute(minute)
    Duration.new(minute: minute)
  end

  def self.second(second)
    Duration.new(second: second)
  end
end
