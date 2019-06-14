require "time_duration/version"

module TimeDuration
  def self.parse(args)
    Duration.parse(args)
  end

  class Duration
    include Comparable

    attr_accessor :seconds

    # TODO: format指定できるようにする
    def self.parse(time_as_string)
      hours, minutes = time_as_string.split(':').map(&:to_i)
      new(hours: hours, minutes: minutes)
    end

    def initialize(hours: 0, minutes: 0, seconds: 0)
      hours = hours.to_i
      minutes = minutes.to_i
      seconds = seconds.to_i
      @seconds = hours * 3600 + minutes * 60 + seconds
    end

    def hours
      minutes / 60 + seconds / 3600
    end

    def minutes
      (seconds / 60) % 60
    end

    # TODO: format指定できるようにする
    def to_s
      "%d:%02d" % [hours, minutes]
    end

    def +(time_duration)
      self.class.new(seconds: seconds + time_duration.seconds)
    end

    def -(time_duration)
      self.class.new(seconds: seconds - time_duration.seconds)
    end

    def <=>(time_duration)
      self.seconds <=> time_duration.seconds
    end

    # override
    def inspect
      to_s
    end
  end
end
