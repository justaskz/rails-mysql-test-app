RSpec.describe WorkersController do
  describe '#create' do
    subject { post(:create, params: params) }

    let(:params) do
      { action_type: action_type }
    end

    before { expect(Workers).to receive(:start) }

    context 'with action type create' do
      let(:action_type) { :create }

      before do
        expect(Records::Create::Worker).to receive(:perform_async).with('create_1')
      end

      specify do
        subject
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'with action type update' do
      let(:action_type) { :update }

      before do
        expect(Records::Update::Worker).to receive(:perform_async).with('update_1')
      end

      specify do
        subject
        expect(subject).to redirect_to(root_path)
      end
    end
  end

  describe '#destroy' do
    subject { delete(:destroy, params: { id: 1 }) }

    specify do
      expect(Workers).to receive(:stop)
      subject
      expect(response).to have_http_status(204)
    end
  end
end
