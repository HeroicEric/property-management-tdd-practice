require 'spec_helper'

describe Owner do
  
  describe 'validations' do

    it { should have_valid(:first_name).when("Yomama") }
    it { should_not have_valid(:first_name).when(nil, "", "4589372957") }

    it { should have_valid(:last_name).when("New Faizaanlia") }
    it { should_not have_valid(:last_name).when(nil, "", "4589372957") }

    it { should have_valid(:email).when("yada@yadayada.com") }
    it { should_not have_valid(:email).when(nil, "", "4759387598347.com") }

    it 'be invalid when email is not unique' do
      Owner.create!(first_name: "linux", last_name: "title", email: "notunique@not.com")
      expect(Owner.create(first_name: "linux", last_name: "title", email: "notunique@not.com").errors).to_not be_blank
    end

  end

  describe 'associations' do

    it { should have_many(:buildings).dependent(:nullify) }

  end

end
