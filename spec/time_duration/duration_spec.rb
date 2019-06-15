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
  end

  describe :<=> do
    it '0:40 <=> 0:30 => 1' do
      expect(TimeDuration.parse('0:40') <=> TimeDuration.parse('0:30')).to be 1
    end

    it '0:30 <=> 0:40 => -1' do
      expect(TimeDuration.parse('0:30') <=> TimeDuration.parse('0:40')).to be -1
    end
  end
end
