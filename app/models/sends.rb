class Sends < ActiveRecord::Base
	belongs_to :users
	belongs_to :messages
end
