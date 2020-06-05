module App
  module_function

  def redis
    @redis ||= Redis.new
  end
end
