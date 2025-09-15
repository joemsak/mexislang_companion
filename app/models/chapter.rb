class Chapter < ApplicationRecord
  validates :number, :title, :page, presence: true
end
