class StarPost < ActiveRecord::Base
  has_many :stars
  has_many :users, through: :stars
end
