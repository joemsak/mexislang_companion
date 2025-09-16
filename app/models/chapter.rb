class Chapter < ApplicationRecord
  validates :number, :title, :page, presence: true

  def display_name
    [number, title].join(". ")
  end
end
