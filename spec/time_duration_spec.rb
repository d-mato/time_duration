# frozen_string_literal: true

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

    it '-0:30 => -0:30' do
      duration = TimeDuration.parse('-0:30')
      expect(duration.to_s).to eq '-0:30'
    end

    it '-1:30 => -1:30' do
      duration = TimeDuration.parse('-1:30')
      expect(duration.to_s).to eq '-1:30'
    end

    it 'reads back what to_s writes' do
      duration = TimeDuration.parse('0:00') - TimeDuration.parse('1:30')
      expect(TimeDuration.parse(duration.to_s)).to eq duration
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
