RSpec.describe Workers do
  subject { described_class }

  specify do
    expect(subject.continue?).to eq(false)
    expect(subject.start).to eq(true)
    expect(subject.continue?).to eq(true)
    expect(subject.stop).to eq(true)
    expect(subject.continue?).to eq(false)
  end
end
