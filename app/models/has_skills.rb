class HasSkill < ActiveRecord::Base
	belongs_to :users
	belongs_to :skills
end
