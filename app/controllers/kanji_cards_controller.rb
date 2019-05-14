class KanjiCardsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @cards = KanjiCard.all
  end

  def show
    @card = KanjiCard.find(params[:id])
  end

  def edit
    @card = KanjiCard.find(params[:id])
  end

  def update
    @card = KanjiCard.find(params[:id])
    @card.save
  end

  def destroy
    @card = KanjiCard.find(params[:id])
    @card.destroy
  end
end
