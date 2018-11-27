describe User do
  describe "user_preferencies" do
    it "has many preferencies" do
      user = build(:user)
      preferences = ['comedy', 'drama']
      user.preferences = preferences
      user.save
      user.reload

      expect(user.preferences).to eq(preferences)
    end
  end

  describe "watched_items" do
    it 'has many watched_items' do
      item1 = create(:item)
      item2 = create(:item)
      item3 = create(:item)


      user1 = create(:user, watched_items: [item1, item3])
      user2 = create(:user, watched_items: [item2])

      expect(user1.watched_items).to eq([item1, item3])
      expect(user2.watched_items).to eq([item2])
    end
  end
end