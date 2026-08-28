# frozen_string_literal: true

module TimeDuration
  # A length of time, held internally as a number of seconds. It may be
  # negative, and hours are not capped: 50 hours formats as "50:00".
  class Duration
    include Comparable

    attr_reader :second

    def self.parse(time_as_string)
      sign = time_as_string.start_with?('-') ? -1 : 1
      hour, minute = time_as_string.delete_prefix('-').split(':').map(&:to_i)
      new(hour: sign * hour, minute: sign * minute)
    end

    def initialize(hour: 0, minute: 0, second: 0)
      hour = hour.to_i
      minute = minute.to_i
      second = second.to_i
      @second = (hour * 3600) + (minute * 60) + second
    end

    def hour
      second.abs / 3600
    end

    def minute
      (second.abs / 60) % 60
    end

    def to_s
      format("#{'-' if second.negative?}%d:%02d", hour, minute)
    end

    def +(other)
      self.class.new(second: second + other.second)
    end

    def -(other)
      self.class.new(second: second - other.second)
    end

    def <=>(other)
      return unless other.is_a?(Duration)

      second <=> other.second
    end

    def eql?(other)
      other.is_a?(Duration) && second == other.second
    end

    def hash
      [Duration, second].hash
    end

    # override
    def inspect
      to_s
    end
  end
end
