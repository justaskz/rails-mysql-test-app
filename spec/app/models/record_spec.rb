RSpec.describe Record do
  subject(:record) { create(:record) }

  specify do
    expect(record.version).to eq(1)
  end
end
