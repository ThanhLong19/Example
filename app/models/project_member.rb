class ProjectMemberController < ApplicationRecord
  belongs_to :project
  belongs_to :member

  validates :project_id, uniqueness: { scope: :member_id }
end
