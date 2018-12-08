class CreatePreference
  def create(name, items)
    ActiveRecord::Base.transaction do
      items.each do |item|
        item.preferences << name

        item.user_item_logs.each do |item_log|
          user = item_log.user
          unless user.preferences.include?(name)
            user.preferences << name
            user.save!
          end
        end

        item.save!
      end
    end
  end
end
