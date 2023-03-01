require "spec_helper"

RSpec.describe Project, type: :model do

  describe "validate" do
    it "have many project_member" do
      should have_many(:project_members)  
    end
  end

  describe "validate" do

    it "check presence of name" do
      should validate_presence_of(:name)
    end

    it "check presence of estimate_time" do
      should validate_presence_of(:estimate_time)
    end

    it "check presence of owner" do
      should validate_presence_of(:owner)
    end

    it "check length of name" do
      should validate_length_of(:name).is_at_most(50)
    end

    it "check length of owner" do
      should validate_length_of(:owner).is_at_most(50)
    end

  end  
end
