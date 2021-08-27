class Admin::SearchesController < ApplicationController
    def search
        @model=params[:model]
        @content=params[:content]
        if @model == 'client'
        @records=Client.search_for(@content)

        else
        @records=Item.search_for(@content)
        end
    end
end
