class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks

  validates :name, presence: true, length: { maximum: 50 }
  validates :estimate_time, presence: true
  validates :owner, presence: true, length: { maximum: 50 }

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at name owner]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[members]
  end
end
