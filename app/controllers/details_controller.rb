class DetailsController < ApplicationController

  def index
    @detail = @item.detail
  end

end
