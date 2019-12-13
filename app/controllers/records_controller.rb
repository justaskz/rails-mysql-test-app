class RecordsController < ApplicationController
  def new
    Records::Create::Worker.perform_async
    render json: { status: :accepted }, status: :accepted
  end

  def edit
    Records::Update::Worker.perform_async
    render json: { status: :accepted }, status: :accepted
  end
end
