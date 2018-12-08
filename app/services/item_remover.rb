class ItemRemover
  def remove(item)
    ActiveRecord::Base.transaction do
      UserItemLog.where(item: item).destroy_all
      item.destroy
    end
  end
end
