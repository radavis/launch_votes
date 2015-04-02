require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when("Bob", "Richard", "Evan") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith", "Davis", "Charles") }
  it { should_not have_valid(:last_name).when(nil, "") }

  describe "#name" do
    it "should combine the first and last name" do
      user = FactoryGirl.create(:user)
      expect(user.name).to eql("#{user.first_name} #{user.last_name}")
    end
  end
end
