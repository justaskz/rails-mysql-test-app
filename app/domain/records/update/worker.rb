class Records::Update::Worker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle threshold: { limit: 100, period: 1.second }

  def perform(worker_id)
    Records::Update.run(worker_id)
    return unless Workers.continue?

    Records::Update::Worker.perform_async(worker_id)
  end
end
