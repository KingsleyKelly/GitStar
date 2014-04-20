

namespace :tasks do


  task :make_10_star_posts => :environment do
    include Client
    stars = starred(10)
    stars.each do |star|
    StarPost.create!(name: star["name"],
                     star: star["stargazers_count"],
                     url:  star["html_url"],
                     avatar: star["owner"]["avatar_url"],
                     updated_at: star['updated_at'],
                     language: star['language'],
                     likes: combined_stars_for_repo(star))
    end
  end

  task :make_user_star_posts => :environment do
    include Client
    stars = all_starred
    stars.each do |star|
      puts "NEW POST #{star["name"]}"
      time = Time.now
      StarPost.create!(name: star["name"],
                       star: star["stargazers_count"],
                       url:  star["html_url"],
                       avatar: star["owner"]["avatar_url"],
                       updated_at: star['updated_at'],
                       language: star['language'],
                       likes: combined_stars_for_repo(star))
      puts Time.now - time
    end
  end
end
