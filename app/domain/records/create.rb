class Records::Create
  def self.run(worker_id)
    Record.create(version: 1, signature: worker_id)
  end
end
