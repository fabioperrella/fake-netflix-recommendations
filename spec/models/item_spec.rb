describe Item do
  describe "item_preferencies" do
    it "has many preferencies and secondary preferences" do
      preferences = ['comedy', 'drama']
      secondary_preferences = ['horror']
      item = build(
        :item,
        preferences: preferences,
        secondary_preferences: secondary_preferences
      )
      item.save
      item.reload

      expect(item.preferences).to eq(preferences)
      expect(item.secondary_preferences).to eq(secondary_preferences)
    end
  end
end