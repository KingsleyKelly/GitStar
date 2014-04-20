# client.starred.first.rels[:contributors].get.data.first.rels[:starred].get.data

module Client

  def get_data(object, relationship)
    object.rels[relationship].get.data
  end

  def client
    Octokit::Client.new(:netrc => true)
  end

  def starred(user=false, entries=10)
    user ||= client
    user.starred.take(entries)
  end

  def all_starred(user=false)
    print user
    Octokit.auto_paginate = true
    user.starred
  end

  def contributors(repo=false)
    repo ||= starred.first
    get_data(repo, :contributors)
  end

  def contributor_stars(contributor)
    get_data(contributor, :starred)
  end

  def combined_stars_for_repo(repo, entries=100)
    total_stars = Hash.new(0)
    contributors(repo).each do |contributor|
      contributor_stars(contributor).each do |starred_repo|
        total_stars[starred_repo.full_name] += 1
      end
    end
    pretty_return(total_stars).take(entries)
  end

  # def combined_all_stars_for_repo(repo, entries=100)
  #   total_stars = Hash.new(0)
  #   contributors(repo).each do |contributor|
  #     contributor_stars(contributor).each do |starred_repo|
  #       total_stars[starred_repo.full_name] += 1
  #     end
  #   end
  #   pretty_return(total_stars).take(entries)
  # end

  def pretty_return(hash)
    hash.sort_by { |k, v| v }.reverse
  end

end
