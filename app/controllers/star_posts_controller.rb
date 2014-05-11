class StarPostsController < ApplicationController


  def stars
    p 1

    if params[:user]
      p 2
      if User.find_by_github_username(params[:user])
          user = User.find_by_github_username(params[:user])
          user.create_star_posts_for_user
      else
        p 3
        if User.has_github(params[:user])
          p 'grep 4'
          User.create!(:email => SecureRandom.hex(16).to_s + "@google.com" , :password => SecureRandom.hex, :github_username => params[:user])
        end
      end
    end
    user ||= current_user

    render :json => user.star_posts

  end

  def get_users
    render :json => User.all.select{|x| x if x.star_posts.count > 1}.map(&:github_username).uniq
  end

  def new_stars

    render :nothing
  end

  # def most_starred
  #   StarPost.all.map(&:)
  # end


end
