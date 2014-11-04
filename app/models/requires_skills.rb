class RequiresSkill < ActiveRecord::Base
	belongs_to :skills
	belongs_to :projects
end
