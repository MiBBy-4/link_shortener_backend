class Link < ApplicationRecord
  validates :base_link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
  validates :description, presence: true, length: { maximum:500 }
  validates_associated :user

  belongs_to :user
  has_many :tags, dependent: :delete_all
end
