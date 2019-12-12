class Records::Update::Worker
  include Sidekiq::Worker

  def perform
    Records::Update.run
  end
end
