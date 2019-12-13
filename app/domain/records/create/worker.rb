class Records::Create::Worker
  include Sidekiq::Worker

  def perform
    Records::Create.run
    Records::Create::Worker.perform_async
  end
end
