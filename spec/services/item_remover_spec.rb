describe ItemRemover do
  describe '#remove ' do
    it 'removes the item and the related logs' do
      item = create(:item)
      user = create(:user)
      user_item_log = create(:user_item_log, item: item, user: user)

      described_class.new.remove(item)

      expect(User.all).to eq([user])
      expect(UserItemLog.count).to eq(0)
      expect(Item.count).to eq(0)
    end
  end
end