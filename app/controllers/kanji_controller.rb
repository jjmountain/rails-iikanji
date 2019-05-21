class KanjiController < ApplicationController

  def index
    if params[:query].present?
      @kanji = Kanji.where(keyword: params[:query])
    else
      @kanji = Kanji.all
    end
  end

  def show
    @kanji = Kanji.find(params[:id])
  end
end
