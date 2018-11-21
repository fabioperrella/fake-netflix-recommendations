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
end