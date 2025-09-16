class Chapter < ApplicationRecord
  has_many :root_words, inverse_of: :chapter

  validates :number, :title, :page, presence: true

  def display_name
    [number, title].join(". ")
  end
end
