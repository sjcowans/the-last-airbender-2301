class SearchController < ApplicationController

  def index
    @characters = SearchFacade.new(params).character_search
  end
end