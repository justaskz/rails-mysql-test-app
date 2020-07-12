class WorkersController < ApplicationController
  def create
    Workers.start
    worker_id = get_worker_id(action_type)
    Records::Create::Worker.perform_async(worker_id) if action_type == 'create'
    Records::Update::Worker.perform_async(worker_id) if action_type == 'update'

    redirect_to(root_path)
  end

  def destroy
    Workers.stop
  end

  private

  def action_type
    params.require(:action_type)
  end

  def get_worker_id(action_type)
    count = App.redis.hget(:worker_count, action_type) || 0
    worker_id = count.to_i + 1
    App.redis.hset(:worker_count, action_type, worker_id)
    "#{action_type}_#{worker_id}"
  end
end
