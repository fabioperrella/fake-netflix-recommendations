describe CreatePreference do
  describe "#create" do
    it 'adds the preference to the item and to users who watched' do
      item1 = create(:item, id: 1)
      item2 = create(:item, id: 2)
      user1 = create(:user, id: 1, preferences: ['drama'])
      user2 = create(:user, id: 2, preferences: ['comedy'])
      create(:user_item_log, user: user1, item: item1)
      create(:user_item_log, user: user2, item: item1)
      create(:user_item_log, user: user1, item: item2)
      create(:user_item_log, user: user2, item: item2)

      new_preference = 'psychology'
      described_class.new.create(new_preference, [item1, item2])

      user1.reload
      user2.reload

      expect(user1.preferences).to eq(['drama', new_preference])
      expect(user2.preferences).to eq(['comedy', new_preference])
    end
  end
end