require "spec_helper"

RSpec.describe Project, type: :model do

  describe "validate" do
    it "have many project_member" do
      should have_many(:project_members)  
    end
  end

  describe "validate" do
    before(:each) do 
      @project = Project.create!(name: "Long", estimate_time: 4, owner: "Long")
    end

    it "check blank of name" do
      @project.name = ""
      expect(@project).to_not be_valid
    end

    it "check length of name" do
      @project.name = "a"*51
      expect(@project).to_not be_valid
    end

    it "check blank of owner" do
      @project.owner = ""
      expect(@project).to_not be_valid
    end

    it "check length of owner" do
      @project.owner = "a"*51
      expect(@project).to_not be_valid
    end
  end  
end
