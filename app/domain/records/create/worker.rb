class Records::Create::Worker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle threshold: { limit: 5, period: 1.second }

  def perform
    Records::Create.run
    return unless Workers.continue?

    Records::Create::Worker.perform_async
  end
end
