require 'spec_helper'

feature 'real estate associate recording building information', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  # AC:
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  before(:each) do
    @owner = FactoryGirl.create(:owner)
    visit owner_path(@owner)
  end

  context "with valid information" do

    scenario 'user creates a building for an owner' do
      fill_in "Street address", with: "10 Lakeville Drive"
      fill_in "City", with: "Roslyn"
      fill_in "State", with: "NY"
      fill_in "Postal code", with: "11576"
      click_on "Create Building"

      expect(page).to have_content("Building Information Added to Listing")
    end

  end

  context "with invalid information" do

    it "will not take in city and state with numbers or postal code with letters" do
      fill_in "Street address", with: "10 Lakeville Drive"
      fill_in "City", with: "34321412"
      fill_in "State", with: "214123421343124124234214325124513435142"
      fill_in "Postal code", with: "sdfalkfjadslfjalsjd;lafj"
      click_on "Create Building"

      expect(page).to have_content("Invalid Information")
    end

  end

end
