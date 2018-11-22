class Item < ApplicationRecord
  serialize :preferences
  serialize :secondary_preferences
end