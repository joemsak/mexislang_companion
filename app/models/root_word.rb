class RootWord < ApplicationRecord
  belongs_to :chapter

  has_many :expressions, inverse_of: :root_word

  delegate :display_name, :title,
    to: :chapter,
    prefix: true

  accepts_nested_attributes_for :chapter

  validates :display_name, :page, presence: true
end
