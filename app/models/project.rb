class Project < ApplicationRecord
  has_many :members, through: :project_members
  has_many :project_members

  validates :name, presence: true, length: { maximum: 50 }
  validates :estimate_time, presence: true
  validates :owner, presence: true, length: { maximum: 50 }
end
