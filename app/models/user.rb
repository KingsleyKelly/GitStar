require 'client'
class User < ActiveRecord::Base
  include Authentication::ActiveRecordHelpers
  has_many :stars
  has_many :star_posts, through: :stars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :create_star_posts_for_user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  include Client
  def create_star_posts_for_user

    puts "Starting build"
    user = client
    stars = all_starred(github_username)
    stars.each do |star|

      time = Time.now
      if StarPost.where(name: star["name"]).blank?
        sp = StarPost.create!(name: star["name"],
                       star: star["stargazers_count"],
                       url:  star["html_url"],
                       avatar: star["owner"]["avatar_url"],
                       updated_at: star['updated_at'],
                       language: star['language'],
                       likes: combined_stars_for_repo(star)
                       )
      else
        sp = StarPost.where(name: star["name"]).first
      end
      unless Star.where(star_post_id: sp.id, user_id: self.id).present?
        Star.create!(star_post_id: sp.id, user_id: self.id)
      end
      puts "NEW POST #{star["name"]}"
      puts Time.now - time
    end
  end
  handle_asynchronously :create_star_posts_for_user, :run_at => Proc.new { 5.seconds.from_now }
end
