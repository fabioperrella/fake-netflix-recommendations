class Item < ApplicationRecord
  serialize :preferences
  serialize :secondary_preferences
  has_many :user_item_logs

  scope :sponsored, -> { where(sponsored: true) }
end