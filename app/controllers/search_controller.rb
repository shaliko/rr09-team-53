class SearchController < ApplicationController

  def index
    @query = params[:q]
    @doclates = Doclate.search(@query).paginate :page => params[:page]
  end

end
