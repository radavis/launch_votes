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
    nominator = FactoryGirl.create(:confirmed_user)
    nominee = FactoryGirl.create(:confirmed_user)

    sign_in(nominator)
    visit new_nomination_path
    select nominee.name, from: "Nominee"
    fill_in "Nomination", with: "Best haircut"
    click_button "Create Nomination"

    expect(page).to have_content("Thanks for your nomination!")
  end

  scenario "user forgets to input nomination" do
    nominator = FactoryGirl.create(:confirmed_user)
    nominee = FactoryGirl.create(:confirmed_user)

    sign_in(nominator)
    visit new_nomination_path
    select nominee.name, from: "Nominee"
    click_button "Create Nomination"

    expect(page).to have_content("Nomination can't be blank")
  end

  scenario "user attempts to nominate self" do
    user = FactoryGirl.create(:confirmed_user)

    sign_in(user)
    visit new_nomination_path
    select user.name, from: "Nominee"
    fill_in "Nomination", with: "Best Student"
    click_button "Create Nomination"

    expect(page).to have_content("Nominator cannot be nominee!")
  end
end
