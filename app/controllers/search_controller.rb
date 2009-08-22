class SearchController < ApplicationController

  def index
    @templates = Template.search(params[q]).paginate :page => params[:page]
  end

end
