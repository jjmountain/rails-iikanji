class KanjiCardsController < ApplicationController

  def index
    if params[:query].present?
      @kanji = Kanji.where(jlpt: params[:query])
    else
      @kanji = Kanji.all
    end
  end

  # def show
  #   @card = KanjiCard.find(params[:id])
  # end

  # def edit
  #   @card = KanjiCard.find(params[:id])
  # end

  # def update
  #   @card = KanjiCard.find(params[:id])
  #   @card.save
  # end

  # def destroy
  #   @card = KanjiCard.find(params[:id])
  #   @card.destroy
  # end
end
