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
end
