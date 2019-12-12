class Records::Create::Worker
  include Sidekiq::Worker

  def perform
    Records::Create.run
  end
end
