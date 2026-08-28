# frozen_string_literal: true

require 'time_duration/version'
require 'time_duration/duration'

# Durations of time that can be parsed, formatted, added, subtracted and
# compared. A duration is not a clock time and is never wrapped around a day.
module TimeDuration
  def self.parse(time_as_string)
    Duration.parse(time_as_string)
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
