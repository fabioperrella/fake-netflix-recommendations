class UserRecommendations
  def self.list(user, fetchers: nil)
    self.send(:new, user, fetchers: fetchers).send(:list)
  end

  private

  def initialize(user, fetchers:)
    @user = user
    @fetchers = fetchers || DEFAULT_FETCHERS
  end
  private_class_method :new

  attr_reader :user, :fetchers

  DEFAULT_FETCHERS = [
    ItemsFetcher::Main,
    ItemsFetcher::Secondary,
    ItemsFetcher::Sponsored,
  ]
  private_constant :DEFAULT_FETCHERS

  def list
    fetchers
      .sort_by(&:order)
      .map{ |fetcher| fetcher.fetch(user) }
      .inject(:+)
  end
end
