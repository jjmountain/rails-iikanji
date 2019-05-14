class KanjiCard < ApplicationRecord
  belongs_to :user
  belongs_to :kanji
  validates :kanji_id, uniqueness: true
  include Sm2

  # every time we load a card, create a
  def next_interval(grade)
    grade = MAX_GRADE if grade > MAX_GRADE

    if grade >= 3
      if repetition == 0
        @interval = 1
        @repetition = 1
      elsif repetition == 1
        @interval = 6
        @repetition = 2
      else
        @interval = (interval * easiness_factor).round
        @repetition = repetition + 1
      end
    else
      @repetition = 0
      @interval = 1
    end

    @easiness_factor = (easiness_factor + D_EF[grade]).round(2)
    @easiness_factor = easiness_factor < 1.3 ? 1.3 : easiness_factor

    return interval
  end
end
