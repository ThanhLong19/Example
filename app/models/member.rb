class Member < ApplicationRecord
  has_many :projects, through: :project_members
  has_many :project_members, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
