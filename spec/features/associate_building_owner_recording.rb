require 'spec_helper'

feature 'record building owner', %q{ As a real estate associate
I want to record a building owner
So that I can keep track of our relationships with owners
} do
# AC:
# I must specify a first name, last name, and email address
# I can optionally specify a company name
# If I do not specify the required information, I am presented with errors
# If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  before(:each) do
    visit new_owner_path
  end

  context 'filling out owner information' do

    it 'requires a first name, last name, and email address' do
      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "Email", with: ""
      click_on "Create Owner"
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
    end

    it "optionally requires a company name and takes me back to unfilled out form page" do
      fill_in "First name", with: "Da"
      fill_in "Last name", with: "Fozanz"
      fill_in "Email", with: "fozanz@wizard.com"
      fill_in "Company name", with: ""
      click_on "Create Owner"
      expect(page).to have_content('Owner Information Created')
      expect(page).to_not have_content('Da')
    end

  end

  context "filling out building owner information in incorrect format" do

    it "will not take in city and state with numbers or postal code with letters" do
      save_and_open_page
      fill_in "First name", with: "08213481249182749812741250912=2-94-294-01924-09"
      fill_in "Last name", with: "4385-09548=8"
      fill_in "Email", with: "75980437095723957239057920387.com.wizard"
      click_on "Create Owner"
      expect(page).to have_content("First name is invalid Last name is invalid Email is invalid")
    end

  end

end
