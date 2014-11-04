class Message < ActiveRecord::Base
	has_many :sends
	has_many :users, :through => :sends
end
