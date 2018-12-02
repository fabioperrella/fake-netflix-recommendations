class Metrics
  def self.save(name:, value:)
    Rails.cache.write(name, value)
  end
end