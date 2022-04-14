class Tag < ApplicationRecord
  validates :tag_name, presence: true
  
  belongs_to :user
  belongs_to :link
end
