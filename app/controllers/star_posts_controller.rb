class StarPostsController < ApplicationController

  def stars
    render :json => StarPost.all.sort_by(&:star).reverse

  end
end
