class SponsoredMetrics
  def initialize(item, user)
    @item = item
    @user = user
  end

  def save
    Metrics.save(name: key, value: value)
  end

  private

  attr_reader :item, :user

  def key
    "item_#{item.id}"
  end

  def value
    {
      user_id: user.id,
      created_at: Time.zone.now
    }
  end
end
