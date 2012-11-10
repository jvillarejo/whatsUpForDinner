require 'spec_helper'

describe Recipe do 
  it "can be instantiated" do
    Recipe.new.should be_an_instance_of(Recipe)
  end

  it "can be saved succesfully" do
    Recipe.create.should be_persisted
  end
  
  it "will give ocassions and feelings when asked for all_tags" do
    recipe = Recipe.new(:name => "Milanesas con pure")
    
    recipe.ocassion_list = "family, friends, withGranny"
    recipe.feeling_list = "yummy, wantfun, fatty"
    
    recipe.save
    
    recipe.all_tags.length.should == 6
    recipe.all_tags.should include "family", "friends", "withGranny", "yummy", "wantfun", "fatty"
  end 
end
