class RecordsController < ApplicationController
  def index
    render json: payload
  end

  def new
    Workers.start
    Records::Create::Worker.perform_async
    render json: { status: :accepted }, status: :accepted
  end

  def edit
    Workers.start
    Records::Update::Worker.perform_async
    render json: { status: :accepted }, status: :accepted
  end

  def stop
    Workers.stop
    redirect_to(records_url)
  end

  private

  def payload
    {
      new: url_for(action: :new),
      update: url_for(action: :edit),
      stop_all: url_for(action: :stop),
      sidekiq: sidekiq_web_url,
      enqueued: sidekiq_stats.processed,
      records: Record.count,
    }
  end

  def sidekiq_stats
    @sidekiq_stats ||= Sidekiq::Stats.new
  end
end
