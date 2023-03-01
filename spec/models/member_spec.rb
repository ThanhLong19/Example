require "spec_helper"

RSpec.describe Member, type: :model do

  describe "validate" do
    it "have many project_member" do
      should have_many(:project_members)  
    end
  end

  describe "validate" do
    before(:each) do 
      @member = Member.create!(name: "Long")
    end

    it "check blank of name" do
      @member.name = ""
      expect(@member).to_not be_valid
    end

    it "check length of name" do
      @member.name = "a"*51
      expect(@member).to_not be_valid
    end
  end
end
