class Records::Update::Worker
  include Sidekiq::Worker

  def perform
    Records::Update.run
    Records::Update::Worker.perform_async
  end
end
