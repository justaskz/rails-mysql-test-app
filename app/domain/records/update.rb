class Records::Update
  def self.run
    record = Record.order('RAND()').limit(1)&.first
    return unless record

    Record.update(record.id, version: record.version + 1)

    true
  end
end
