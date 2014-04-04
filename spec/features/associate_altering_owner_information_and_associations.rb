require 'spec_helper'

feature '', %q{As a real estate associate
I want to correlate an owner with buildings
So that I can refer back to pertinent information
} do
# AC:
# When recording a building, I want to optionally associate the building with its rightful owner.
# If I delete an owner, the owner and its primary key should no longer be associated with any properties.
 
  before(:each) do
    @owner = FactoryGirl.create(:owner)
    visit owner_path(@owner)
  end

  context 'owner association' do

    it 'gives the option to associate a building with a owner' do
      fill_in "Street address", with: "10 Lakeville Drive"
      fill_in "City", with: "Roslyn"
      fill_in "State", with: "NY"
      fill_in "Postal code", with: "11576"
      select('Associate with building', from: 'Relationship')
      click_on "Create Building"
      expect(page).to have_content("10 Lakeville Drive")
    end

    it 'gives the option to disassociate a building with a owner' do
      fill_in "Street address", with: "10 Lakeville Drive"
      fill_in "City", with: "Roslyn"
      fill_in "State", with: "NY"
      fill_in "Postal code", with: "11576"
      select('Disassociate With Building', from: 'Relationship')
      click_on "Create Building"
      expect(page).to_not have_content("10 Lakeville Drive")
    end

  end

  context 'deleting owner' do

      it "allows you to delete owner" do
        fill_in "Street address", with: "10 Lakeville Drive"
        fill_in "City", with: "Roslyn"
        fill_in "State", with: "NY"
        fill_in "Postal code", with: "11576"
        select('Associate with building', from: 'Relationship')
        click_on "Create Building"
        click_on "Delete Owner"
        expect(page).to have_content("Owner Information Deleted")
        expect(@owner.buildings).to be_blank
      end

  end

end
