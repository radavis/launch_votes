require "rails_helper"

feature "user signs up" do
  scenario "with valid credentials" do
    visit root_path
    click_link "Sign Up"

    fill_in "First name", with: "Richard"
    fill_in "Last name", with: "Davis"
    fill_in "Email", with: "richard.davis@launchacademy.com"
    fill_in "Password", with: "test1234"
    fill_in "Password confirmation", with: "test1234"
    click_button "Sign Up"

    expect(page).to have_content("Thanks for signing up!")
  end
end
