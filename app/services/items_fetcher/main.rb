module ItemsFetcher
  class Main
    def self.fetch(user)
      send(:new, user).send(:fetch)
    end

    def self.order
      2
    end

    private

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def fetch
      Item.where(main_preferences)
    end

    def main_preferences
      user.preferences
        .map { |preference| "preferences like '%#{preference}%'" }
        .join(" OR ")
    end
  end
end