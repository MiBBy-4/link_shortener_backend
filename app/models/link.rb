class Link < ApplicationRecord
  validates :base_link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
end
