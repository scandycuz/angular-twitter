class User < ActiveRecord::Base

  validates :screen_name, presence: true, uniqueness: true

  has_many :tweets

end
