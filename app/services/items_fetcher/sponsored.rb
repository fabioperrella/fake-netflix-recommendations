module ItemsFetcher
  class Sponsored
    def self.fetch(user)
      send(:new, user).send(:fetch)
    end

    def self.order
      1
    end

    private

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def fetch
      Item.where(sponsored: true)
    end
  end
end