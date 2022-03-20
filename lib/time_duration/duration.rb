module TimeDuration
  class Duration
    include Comparable

    attr_reader :second

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
      minute / 60 + second.abs / 3600
    end

    def minute
      (second.abs / 60) % 60
    end

    # TODO: format指定できるようにする
    def to_s
      "#{'-' if second < 0}%d:%02d" % [hour, minute]
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
