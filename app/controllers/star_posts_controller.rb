class StarPostsController < ApplicationController

  def stars
    render :json => StarPost.all

  end
end
