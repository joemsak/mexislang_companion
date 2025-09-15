class Chapter < ApplicationRecord
  validates :title, :page, presence: true
end
