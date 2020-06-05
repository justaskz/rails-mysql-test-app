class Records::Update::Worker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle threshold: { limit: 5, period: 1.second }

  def perform
    Records::Update.run
    return unless Workers.continue?

    Records::Update::Worker.perform_async
  end
end
