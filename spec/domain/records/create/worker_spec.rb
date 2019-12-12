RSpec.describe Records::Create::Worker, '#perform' do
  subject { described_class.new.perform }

  specify do
    expect(Records::Create).to receive(:run)
    subject
  end
end
