require 'time_duration/version'

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

  class Duration
    include Comparable

    attr_accessor :second

    # TODO: format指定できるようにする
    def self.parse(time_as_string, format: '%H:%M')
      hour, minute = time_as_string.split(':').map(&:to_i)
      new(hour: hour, minute: minute)
    end

    def initialize(hour: 0, minute: 0, second: 0)
      hour = hour.to_i
      minute = minute.to_i
      second = second.to_i
      @second = hour * 3600 + minute * 60 + second
    end

    def hour
      minute / 60 + second / 3600
    end

    def minute
      (second / 60) % 60
    end

    # TODO: format指定できるようにする
    def to_s
      "%d:%02d" % [hour, minute]
    end

    def +(time_duration)
      self.class.new(second: second + time_duration.second)
    end

    def -(time_duration)
      self.class.new(second: second - time_duration.second)
    end

    def <=>(time_duration)
      self.second <=> time_duration.second
    end

    # override
    def inspect
      to_s
    end
  end
end
