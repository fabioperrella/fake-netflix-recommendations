class AddSponsoredToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sponsored, :boolean
  end
end
