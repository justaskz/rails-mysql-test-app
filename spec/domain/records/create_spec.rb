RSpec.describe Records::Create, '.run' do
  subject { described_class.run(worker_id) }

  let(:worker_id) { 'create_1' }

  specify do
    expect { subject }.to change { Record.count }.by(1)
    expect(Record.first).to have_attributes(version: 1, signature: worker_id)
  end
end
