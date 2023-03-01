require "spec_helper"

RSpec.describe ProjectMember, type: :model do

  describe "relationship" do
    it "belongs to project" do
      project = described_class.reflect_on_association(:project)  
      expect(project.macro).to eq :belongs_to
    end

    it "belongs to member" do
      member = described_class.reflect_on_association(:member)  
      expect(member.macro).to eq :belongs_to
    end
  end
end
