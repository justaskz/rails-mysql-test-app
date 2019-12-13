RSpec.describe RecordsController do
  describe '#new' do
    specify do
      expect(Records::Create::Worker).to receive(:perform_async)
      get(:new)
      expect(response).to have_http_status(:accepted)
    end
  end

  describe '#edit' do
    specify do
      expect(Records::Update::Worker).to receive(:perform_async)
      get(:edit)
      expect(response).to have_http_status(:accepted)
    end
  end
end
