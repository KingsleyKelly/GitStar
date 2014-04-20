class StarPostsController < ApplicationController


  def stars
    user = current_user
    render :json => user.star_posts

  end

  # def most_starred
  #   StarPost.all.map(&:)
  # end


end
