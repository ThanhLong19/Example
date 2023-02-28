class Project < ApplicationRecord
  has_many :members, through: :projects_members
  has_many :projects_members
end
