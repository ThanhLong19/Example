require "spec_helper"

RSpec.describe ProjectMember, type: :model do

  describe "relationship" do
    it "belongs to project" do
      should belong_to(:project)
    end
    it "belongs to member" do
      should belong_to(:member)
    end
  end
end
