require "rails_helper"

RSpec.describe Nomination, type: :model do
  it { should belong_to(:nominee) }
  it { should belong_to(:nominator) }

  it { should have_valid(:content).when("Best haircut", "Best Smasher", "Highest score in NWC") }
  it { should_not have_valid(:content).when(nil, "") }
end
