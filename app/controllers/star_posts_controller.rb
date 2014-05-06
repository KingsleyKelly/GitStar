class StarPostsController < ApplicationController


  def stars
    p params
    if params[:user]
      if User.find_by_github_username(params[:user])
          user = User.find_by_github_username(params[:user])
          user.create_star_posts_for_user
      else
        p 'sup'
        User.create!(:email => SecureRandom.hex(16).to_s + "@google.com" , :password => SecureRandom.hex, :github_username => params[:user])
      end
    end
    user ||= current_user

    render :json => user.star_posts

  end

  def get_user_stars
    p 'wooowowoo'
    p params

    user.create_star_posts_for_user
    render :json => user.star_posts
  end
  def new_stars

    render :nothing
  end

  # def most_starred
  #   StarPost.all.map(&:)
  # end


end
