class Records::Update
  def self.run
    record = Record.order('RAND()').limit(1)&.first
    Record.update(record.id, version: record.version + 1)

    true
  end
end
