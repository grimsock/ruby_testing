require_relative '../lib/code.rb'

RSpec.describe BlaCar do
  let(:engine) { instance_double('Engine') }
  let(:key) { Key.new('asdf') }
  let(:subject) { BlaCar.new('x1200', engine, 'red', key) }

  describe '#beep' do
    it 'returns alarming phrase' do
      expect(subject.beep).to eq 'Beeeeeep!!!'
    end
  end
end
