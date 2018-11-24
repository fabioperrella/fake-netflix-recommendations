module ItemsFetcher
  class Secondary
    def self.fetch(user)
      send(:new, user).send(:fetch)
    end

    def self.order
      3
    end

    private

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def fetch
      Item.where(secondary_preferences)
    end

    def secondary_preferences
      user.preferences
        .map { |preference| "secondary_preferences like '%#{preference}%'" }
        .join(" OR ")
    end
  end
end