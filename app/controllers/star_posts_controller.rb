class StarPostsController < ApplicationController


  def stars
    render :json => StarPost.all

  end

  # def most_starred
  #   StarPost.all.map(&:)
  # end


end
