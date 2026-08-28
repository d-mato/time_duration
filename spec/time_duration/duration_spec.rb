# frozen_string_literal: true

RSpec.describe TimeDuration::Duration do
  describe :+ do
    it '0:40 + 0:30 = 1:10' do
      duration = TimeDuration.parse('0:40') + TimeDuration.parse('0:30')
      expect(duration.to_s).to eq '1:10'
    end

    it '50:00 + 50:00 = 100:00' do
      duration = TimeDuration.parse('50:00') + TimeDuration.parse('50:00')
      expect(duration.to_s).to eq '100:00'
    end
  end

  describe :- do
    it '0:40 - 0:30 = 0:10' do
      duration = TimeDuration.parse('0:40') - TimeDuration.parse('0:30')
      expect(duration.to_s).to eq '0:10'
    end

    it '1:00 - 0:20 = 0:40' do
      duration = TimeDuration.parse('1:00') - TimeDuration.parse('0:20')
      expect(duration.to_s).to eq '0:40'
    end

    it '0:00 - 0:01 = -0:01' do
      duration = TimeDuration.parse('0:00') - TimeDuration.parse('0:01')
      expect(duration.to_s).to eq '-0:01'
    end
  end

  describe :<=> do
    it '0:40 <=> 0:30 => 1' do
      expect(TimeDuration.parse('0:40') <=> TimeDuration.parse('0:30')).to be 1
    end

    it '0:30 <=> 0:40 => -1' do
      expect(TimeDuration.parse('0:30') <=> TimeDuration.parse('0:40')).to be(-1)
    end

    it '0:60 <=> 1:00 => 0' do
      expect(TimeDuration.parse('0:60') <=> TimeDuration.parse('1:00')).to be 0
    end

    it '0:40 <=> 3600 => nil' do
      expect(TimeDuration.parse('0:40') <=> 3600).to be_nil
    end
  end

  describe :eql? do
    it '0:60 eql? 1:00 => true' do
      expect(TimeDuration.parse('0:60').eql?(TimeDuration.parse('1:00'))).to be true
    end

    it '0:60 eql? 0:30 => false' do
      expect(TimeDuration.parse('0:60').eql?(TimeDuration.parse('0:30'))).to be false
    end

    it '0:60 eql? 3600 => false' do
      expect(TimeDuration.parse('0:60').eql?(3600)).to be false
    end
  end

  describe :hash do
    it 'equal durations share a hash key' do
      table = { TimeDuration.parse('0:60') => :an_hour }
      expect(table[TimeDuration.parse('1:00')]).to be :an_hour
    end

    it 'equal durations collapse under uniq' do
      durations = [TimeDuration.parse('0:60'), TimeDuration.parse('1:00')]
      expect(durations.uniq.size).to eq 1
    end
  end

  describe :== do
    it '0:40 == 3600 => false' do
      expect(TimeDuration.parse('0:40') == 3600).to be false
    end
  end
end
