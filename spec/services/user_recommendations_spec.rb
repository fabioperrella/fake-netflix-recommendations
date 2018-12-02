describe UserRecommendations do
  describe ".list" do
    it "returns a list of items" do
      # setup
      user = build(:user, preferences: ['drama', 'commedy'])
      _item1 = create(:item, preferences: ['drama'])
      _item2 = create(:item, preferences: ['commedy'])

      # exercise
      result = described_class.list(user)

      # verify
      expect(result.map(&:class).uniq).to eq([Item])
    end

    it 'retuns items mathing with the user preferences' do
      # setup
      user = build(:user, preferences: ['drama', 'commedy'])
      item1 = create(:item, preferences: ['drama'])
      item2 = create(:item, preferences: ['commedy'])
      _item3 = create(:item, preferences: ['scifi'])

      # exercise
      result = described_class.list(user)

      # verify
      expect(result).to match_array([item1, item2])
    end

    it 'returns items of secundary preferences in the bottom of the list' do
      user = build(:user, preferences: ['drama', 'commedy'])
      item1 = create(
        :item,
        preferences: ['sports'],
        secondary_preferences: ['drama']
      )
      item2 = create(:item, preferences: ['commedy'])
      _item3 = create(:item, preferences: ['scifi'])
      item4 = create(:item, preferences: ['drama'])

      # exercise
      result = described_class.list(user)

      # verify
      expect(result[0..1]).to match_array([item4, item2])
      expect(result[2]).to eq(item1)
    end

    it 'returns sponsored items in the top of the list' do
      # setup
      user = build_stubbed(:user, preferences: ['drama', 'commedy'])
      item1 = create(:item, preferences: ['drama'])
      item2 = create(:item, preferences: ['commedy'])
      item_anita = create(
        :item,
        name: 'Anita',
        preferences: ['music'],
        sponsored: true
      )

      # exercise
      result = described_class.list(user)

      # verify
      expect(result[0]).to eq(item_anita)
      expect(result[1..2]).to match_array([item1, item2])
    end

    it 'does not recommend a watched item' do
      # setup
      item1 = create(:item, preferences: ['sports'])
      item2 = create(:item, preferences: ['sports'])
      user = create(:user, preferences: ['sports'], watched_items: [item1])

      # exercise
      result = described_class.list(user)

      # verify
      expect(result).to eq([item2])
    end
  end
end