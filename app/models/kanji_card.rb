class KanjiCard < Sm2::Fact < ApplicationRecord
  belongs_to :user
  belongs_to :kanji
  validates: kanji_id, uniqueness: true
end
