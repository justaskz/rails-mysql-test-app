RSpec.describe Records::Create, '.run' do
  subject { described_class.run }

  specify do
    expect { subject }.to change { Record.count }.by(1)
  end
end
