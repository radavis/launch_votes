require "rails_helper"

feature %q(
  As a Launcher
  I want to see what my fellow Launchers have been nominated for
  So that I might have a laugh.
) do

  # Acceptance Criteria

  # [x] Authenticated user views nominations
  # [x] Un-authenticated users are not authorized
  # Nominees cannot see their awards
  # Admin views awards in ascending order of votes

  scenario "user signs in and views nominations" do
    user = FactoryGirl.create(:confirmed_user)
    nomination = FactoryGirl.create(:nomination)

    sign_in user
    visit nominations_path
    expect(page).to have_content(nomination.content)
    expect(page).to have_content(nomination.nominee.name)
  end

  scenario "unauthenticated user cannot see nominations" do
    visit nominations_path
    expect(page).to have_content "You need to sign in first!"
  end
end
