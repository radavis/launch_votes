require "rails_helper"

feature "user signs in" do
  scenario "with valid credentials" do
    user = FactoryGirl.create(:confirmed_user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_link("Sign Out")
    expect(page).to_not have_link("Sign Up")
  end
end
