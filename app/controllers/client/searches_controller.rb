class Client::SearchesController < ApplicationController
  def search
    @content=params["search"]["value"]
    @records=Item.search_for(@content)
  end
end
