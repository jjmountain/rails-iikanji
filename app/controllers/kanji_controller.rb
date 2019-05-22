class KanjiController < ApplicationController

  def index
    if params[:query].present?
      sql_query = " \
        character ILIKE :query \
        OR koohii1 ILIKE :query \
        OR koohii2 ILIKE :query \
        OR onyomi ILIKE :query \
        OR kunyomi ILIKE :query \
        OR english ILIKE :query \
        OR keyword ILIKE :query \
        "
      @kanji = Kanji.where(sql_query, query: "%#{params[:query]}%")
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      @kanji = Kanji.all
    end
  end

  def show
    @kanji = Kanji.find(params[:id])
  end

end
