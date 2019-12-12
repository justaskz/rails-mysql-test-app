RSpec.describe Records::Update, '.run' do
  subject { described_class.run }

  let!(:record) { create(:record, version: 2) }

  specify do
    expect { subject }
      .to change { record.reload.version }
      .from(record.version)
      .to(record.version + 1)

    expect(subject).to eq(true)
  end
end
