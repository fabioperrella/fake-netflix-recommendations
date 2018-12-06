class CreateUserItemLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_item_logs do |t|
      t.references :user
      t.references :item
      t.timestamp
    end
  end
end
