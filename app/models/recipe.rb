class Recipe < ActiveRecord::Base
  attr_accessible :cooking_times, :favourite, :guide, :name
end
