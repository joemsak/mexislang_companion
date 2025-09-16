class RootWord < ApplicationRecord
  belongs_to :chapter

  delegate :display_name, :title,
    to: :chapter,
    prefix: true

  accepts_nested_attributes_for :chapter

  validates :display_name, :page, presence: true
end
