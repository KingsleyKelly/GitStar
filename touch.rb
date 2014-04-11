require 'json'
require 'active_record'

f = File.read('stars.json')
f = JSON.parse(f)
f.each{|x|
  StarPost.create!(name: x["name"], star: x["stargazers"])
}
