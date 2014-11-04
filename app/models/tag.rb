class Tags < ActiveRecord::Base

	has_many :has_tags
	has_many :projects, :through => :has_tags
end
