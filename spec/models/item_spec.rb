describe Item do
  describe "validations" do

  end

  describe "relationships" do

  end

  describe "instance methods" do
    it "#price_in_dollars" do
      item = create(:item, price: 5000)

      expect(item.price_in_dollars). to eq("$50.00")
    end
  end
end