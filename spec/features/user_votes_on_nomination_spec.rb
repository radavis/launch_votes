require "rails_helper"

feature %q(
  User votes on a nomination

  As a Launcher
  I want to vote on a nomination
  So that the silliest nominations rise to the top!

) do

  # Acceptance Criteria

  # [x] Authenticated user votes on a nomination
  # [x] User cannot vote twice for the same nomination
  # User cannot vote on old nominations

  let(:user) { FactoryGirl.create(:confirmed_user) }
  let!(:nomination) { FactoryGirl.create(:nomination) }

  scenario "user votes on nomination" do
    sign_in user
    visit nominations_path
    click_button "Vote!"
    expect(page).to have_content("Thanks for voting!")
  end

  scenario "user attempts to vote twice" do
    sign_in user
    visit nominations_path
    click_button "Vote!"
    click_button "Vote!"
    expect(page).to have_content("You can only vote on a nomination once, buddy!")
  end

end
