require 'spec_helper'

describe "ContractorProfiles" do
  describe "GET /contractor_profiles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get contractor_profiles_path
      response.status.should be(200)
    end
  end
end
