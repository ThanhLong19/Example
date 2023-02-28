class Member < ApplicationRecord
  has_many :projects, through: :projects_members
  has_many :projects_members
end
