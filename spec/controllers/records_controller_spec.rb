RSpec.describe RecordsController do
  describe '#index' do
    specify do
      get(:index)
      response_json = JSON.parse(response.body, symbolize_names: true)
      expected_keys = [:enqueued, :new, :records, :sidekiq, :stop_all, :update]

      expect(response_json.keys.sort).to eq(expected_keys)
    end
  end

  describe '#new' do
    specify do
      expect(Workers).to receive(:start)
      expect(Records::Create::Worker).to receive(:perform_async)
      get(:new)
      expect(response).to have_http_status(:accepted)
    end
  end

  describe '#edit' do
    specify do
      expect(Workers).to receive(:start)
      expect(Records::Update::Worker).to receive(:perform_async)
      get(:edit)
      expect(response).to have_http_status(:accepted)
    end
  end

  describe '#stop' do
    specify do
      expect(Workers).to receive(:stop)
      get(:stop)
      expect(subject).to redirect_to(records_path)
    end
  end
end
