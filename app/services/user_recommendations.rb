class UserRecommendations
  def self.list(user)
    self.send(:new, user).send(:list)
  end

  private

  def initialize(user)
    @user = user
  end
  private_class_method :new

  attr_reader :user

  def list
    sponsored_items + main_items + secondary_items
  end

  def sponsored_items
    Item.where(sponsored: true)
  end

  def main_items
    Item.where(main_preferences)
  end

  def secondary_items
    Item.where(secondary_preferences)
  end

  def main_preferences
    user.preferences
      .map { |preference| "preferences like '%#{preference}%'" }
      .join(" OR ")
  end

  def secondary_preferences
    user.preferences
      .map { |preference| "secondary_preferences like '%#{preference}%'" }
      .join(" OR ")
  end
end


