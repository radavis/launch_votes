require "rails_helper"

feature "user signs out" do
  scenario "user signs out" do
    user = FactoryGirl.create(:confirmed_user)
    sign_in(user)
    visit root_path
    click_link "Sign Out"
    expect(page).to have_content("Signed Out. Please come back soon!")
  end
end
