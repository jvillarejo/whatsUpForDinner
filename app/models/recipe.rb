class Recipe < ActiveRecord::Base
  attr_accessible :cooking_times, :favourite, :guide, :name, :ocassion_list, :feeling_list
  
  acts_as_taggable
  acts_as_taggable_on :ocassions, :feelings
  
  def all_tags
    tag_name = lambda { |tag| tag.name }
    ocassions.collect(&tag_name) + feelings.collect(&tag_name)
  end
end
