require "rails_helper"

feature %q(
  User votes on a nomination

  As a Launcher
  I want to vote on a nomination
  So that the silliest nominations rise to the top!

) do

  # Acceptance Criteria

  # Authenticated user votes on a nomination
  # User cannot vote twice for the same nomination
  # User cannot vote on old nominations

  scenario "user votes on nomination" do
    user = FactoryGirl.create(:confirmed_user)
    nomination = FactoryGirl.create(:nomination)

    sign_in user
    visit nominations_page
    click_button "Vote!"
    expect(page).to have_content("Thanks for voting!")
  end

end
