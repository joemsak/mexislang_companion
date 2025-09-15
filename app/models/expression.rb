class Expression < ApplicationRecord
  belongs_to :root_word

  delegate :display_name,
    to: :root_word,
    prefix: true

  accepts_nested_attributes_for :root_word

  validates :en_us, :es_mx, :page, presence: true
end
