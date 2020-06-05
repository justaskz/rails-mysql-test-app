class Records::Update::Worker
  include Sidekiq::Worker

  def perform
    Records::Update.run
    return unless Workers.continue?

    Records::Update::Worker.perform_async
  end
end
