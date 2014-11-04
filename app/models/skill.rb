class Skill < ActiveRecord::Base

	has_many :has_skill
	has_many :users, :through => :has_skill

	has_many :requires_skill
	has_many :projects, :through => :requires_skill
end
