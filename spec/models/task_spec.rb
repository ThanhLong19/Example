require "spec_helper"

RSpec.describe Task, type: :model do

  describe "validate" do
    it "check presence of content" do
      should validate_presence_of(:content)
    end

    it "check length of content" do
      should validate_length_of(:content).is_at_least(10)
    end
  end
end
