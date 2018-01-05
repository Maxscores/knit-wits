describe "Visits cart page" do
  before(:each) do
    @item = create(:item)
    @user = create(:user)

    visit items_path
    click_button "Add to Cart"
    click_button "Add to Cart"
  end

  context "as a visitor" do
    it "cannot checkout unless signed in" do
      visit cart_path

      expect(page).to have_link("Login or Create Account to Checkout")
    end

    it "clicks on create accound and creates an account" do
      visit cart_path

      click_link "Login or Create Account to Checkout"

      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on "Log Me In"

      visit cart_path

      expect(page).to have_content(@item.title)
    end
  end

  context "as a signed in user" do
    it "can checkout if signed in" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit cart_path

      expect(page).to have_link("Checkout")

    end
  end
end
