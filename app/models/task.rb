class Task < ApplicationRecord
  belongs_to :projects
  
  validates :content, presence: true, length: {minimum: 10}
end
