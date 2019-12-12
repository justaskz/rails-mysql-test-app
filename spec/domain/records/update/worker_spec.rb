RSpec.describe Records::Update::Worker, '#perform' do
  subject { described_class.new.perform }

  specify do
    expect(Records::Update).to receive(:run)

    subject
  end
end
