require "rails_helper"

feature %q(
  As a Launcher
  I want to nominate fellow Launchers for awards
  So that everyone can celebrate their awesomeness.
) do

  # Acceptance Criteria

  # Authenticated user nominates another user
  # User cannot nominate self
  # Users can only see people on the same team

  scenario "authenticated user nominates another user" do
    nominator = FactoryGirl.create(:user)
    nominee = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"

    fill_in "Email", with: nominator.email
    fill_in "Password", with: nominator.password
    click_button "Sign In"

    # nominate another user
    visit new_nomination_path
    select nominee.name, from: "Nominee"
    fill_in "Nomination", with: "Best haircut"
    click_button "Create Nomination"

    expect(page).to have_content("Thank you for your nomination!")
  end
end
