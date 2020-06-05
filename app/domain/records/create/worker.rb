class Records::Create::Worker
  include Sidekiq::Worker

  def perform
    Records::Create.run
    return unless Workers.continue?

    Records::Create::Worker.perform_async
  end
end
