require 'spec_helper'

feature 'record building owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # AC:
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context "with valid information" do

    scenario "user creates an owner" do
      visit new_owner_path

      fill_in "First name", with: "Da"
      fill_in "Last name", with: "Fozanz"
      fill_in "Email", with: "fozanz@wizard.com"
      fill_in "Company name", with: ""
      click_on "Create Owner"

      expect(page).to have_content('Owner Information Created')
      # Check that they're redirected to the correct page instead of testing
      # for content not to appear on the page
      expect(current_path).to eq new_owner_path
    end

  end

  context 'with invalid information' do

    scenario 'an owner is not created' do
      visit new_owner_path

      click_on "Create Owner"

      # Let your unit tests handle all the individual errors
      expect(page).to have_content("There were some errors")
    end

  end

end
