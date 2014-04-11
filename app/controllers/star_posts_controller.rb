class StarPostsController < ApplicationController

  def index
    @stars = StarPost.all.as_json
  end
end
