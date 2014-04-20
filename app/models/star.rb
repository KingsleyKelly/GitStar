class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :star_post
end
