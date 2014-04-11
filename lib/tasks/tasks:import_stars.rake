namespace :tasks do
  task :import_stars => :environment do
    f = File.read('stars.json')
    f = JSON.parse(f)
    f.each{|x|
      StarPost.create!(name: x["name"], star: x["stargazers_count"])
    }
  end
end
