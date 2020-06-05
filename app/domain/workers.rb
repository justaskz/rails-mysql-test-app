class Workers
  class << self
    def start
      App.redis.set(key, true)

      true
    end

    def continue?
      App.redis.get(key) == 'true'
    end

    def stop
      App.redis.set(key, false)

      true
    end

    private

    def key
      :workers_status
    end
  end
end
