class Member < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :projects, through: :project_members

  validates :name, presence: true, length: { maximum: 50 }
end
