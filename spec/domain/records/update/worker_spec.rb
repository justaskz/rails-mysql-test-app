RSpec.describe Records::Update::Worker, '#perform' do
  subject { described_class.new.perform(worker_id) }

  let(:worker_id) { 'update_1' }

  before do
    allow(Workers)
      .to receive(:continue?)
      .and_return(is_continuing)
  end

  context 'when continuing' do
    let(:is_continuing) { true }

    specify do
      expect(Records::Update).to receive(:run).with(worker_id)
      expect { subject }.to change(described_class.jobs, :size).by(1)
    end
  end

  context 'when not continuing' do
    let(:is_continuing) { false }

    specify do
      expect(Records::Update).to receive(:run).with(worker_id)
      expect { subject }.to change(described_class.jobs, :size).by(0)
    end
  end
end
