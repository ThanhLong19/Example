class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members

  accepts_nested_attributes_for :project_members, :allow_destroy => true, reject_if: proc { |attributes| attributes['member_id'] == "0" }

  validates :name, presence: true, length: { maximum: 50 }
  validates :estimate_time, presence: true
  validates :owner, presence: true, length: { maximum: 50 }
end
