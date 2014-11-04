class HasTags < ActiveRecord::Base
	belongs_to :tags
	belongs_to :projects
end
