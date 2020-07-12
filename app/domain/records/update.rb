class Records::Update
  def self.run(worker_id)
    record = Record.order('RAND()').limit(1)&.first
    return unless record

    Record.update(record.id, version: record.version + 1, signature: worker_id)
    updated_record = Record.find(record.id)

    raise('Record version was not updated') if updated_record.version <= record.version
    raise('Received outdated record') if updated_record.updated_at <= record.updated_at

    true
  end
end
