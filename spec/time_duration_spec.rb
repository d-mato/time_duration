RSpec.describe TimeDuration do
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
end
