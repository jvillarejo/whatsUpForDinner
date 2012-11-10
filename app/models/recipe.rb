class Recipe < ActiveRecord::Base
  attr_accessible :cooking_times, :favourite, :guide, :name
  
  acts_as_taggable
  acts_as_taggable_on :ocassions, :feelings
  
end
