RSpec.describe TimeDuration do
  describe :parse do
    it '1:10 => 1:10' do
      duration = TimeDuration.parse('1:10')
      expect(duration.to_s).to eq '1:10'
    end

    it '1:70 => 2:10' do
      duration = TimeDuration.parse('1:70')
      expect(duration.to_s).to eq '2:10'
    end
  end

  describe :hour do
    subject { TimeDuration.hour(argument) }

    context 'argument is 8' do
      let(:argument) { 8 }
      it { is_expected.to eq TimeDuration::Duration.new(hour: 8) }
    end
  end

  describe :minute do
    subject { TimeDuration.minute(argument) }

    context 'argument is 8' do
      let(:argument) { 8 }
      it { is_expected.to eq TimeDuration::Duration.new(minute: 8) }
    end
  end

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
