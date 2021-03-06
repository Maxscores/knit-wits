describe 'user can view cart total' do
  context 'items are in cart' do
    before(:each) do
      @user = create(:user)
      @item = create(:item)
      visit "/login"

      fill_in "username", with: "bob"
      fill_in "password", with: 'password'
      click_on "Log In"
    end

    it 'user adds item, total changes' do
      visit item_path(@item)
      click_button "Add to Cart"
      visit item_path(@item)
      click_button "Add to Cart"
      total = @item.price * 2

      click_link ("2")


      expect(current_path).to eq(cart_path)
      expect(page).to have_link("#{@item.title}")
      expect(page).to have_content("$100.00")
    end

    it 'user can decrease item, total changes' do
      visit item_path(@item)
      click_button "Add to Cart"
      visit item_path(@item)
      click_button "Add to Cart"
      total = @item.price * 2

      click_link ("2")

      fill_in "item[quantity]", with: 4
      click_on "Update"

      expect(page).to have_content(4)
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Knit Total Cost: $200.00")
    end

    it "has no items in cart" do
      visit cart_path

      expect(page).to have_content("Shopping Cart")
      expect(page).to have_content("Your cart is currently Empty")
      expect(page).to have_content("Continue Shopping")
      expect(page).to have_link("here")
    end
  end
end
