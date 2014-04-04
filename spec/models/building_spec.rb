require 'spec_helper'

describe Building do
  
  describe 'validations' do

    it { should have_valid(:street_address).when("10 yellowbrick road") }
    it { should_not have_valid(:street_address).when(nil, "") }

    it { should have_valid(:state).when("New Faizaanlia") }
    it { should_not have_valid(:state).when(nil, "", "8091284-0238-4017207210959028283401248291734901724") }

    it { should have_valid(:city).when("Faizaanville") }
    it { should_not have_valid(:city).when(nil, "", "8091284-0238-4017207210959028283401248291734901724") }

    it { should have_valid(:postal_code).when("91191") }
    it { should_not have_valid(:postal_code).when(nil, "", 234423414124124, "Faizaanville") }


    it 'be invalid when email is not unique' do
      Building.create!(street_address: "10 yellowbrick road", state: "NY", city: "CITY", postal_code: "11223")
      expect( Building.create(street_address: "10 yellowbrick road", state: "NY", city: "CITY", postal_code: "11223").errors).to_not be_blank
    end

  end

  describe 'associations' do

    it { should belong_to :owner }

  end

end
