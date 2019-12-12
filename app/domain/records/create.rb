class Records::Create
  def self.run
    Record.create(version: 1)
  end
end
