namespace :tasks do
  task :import_stars => :environment do
    f = File.read('stars.json')
    f = JSON.parse(f)
    f.each{|x|
      StarPost.create!(name: x["name"],
                       star: x["stargazers_count"],
                       url:  x["html_url"],
                       avatar: x["owner"]["avatar_url"],
                       updated_at: x['updated_at'],
                       language: x['language'])
    }
  end
end
