class Example < ApplicationRecord
  belongs_to :root_word

  accepts_nested_attributes_for :root_word
end
