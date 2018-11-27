class User < ApplicationRecord
  serialize :preferences

  has_many :user_item_logs
  has_many :watched_items, through: :user_item_logs, source: :item
end