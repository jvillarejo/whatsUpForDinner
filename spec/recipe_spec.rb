require 'spec_helper'

describe Recipe do 
  it "can be instantiated" do
    Recipe.new.should be_an_instance_of(Recipe)
  end

  it "can be saved succesfully" do
    Recipe.create.should be_persisted
  end
  
  it "will bring all feelings related to recipes when asked for feelings" do 
    recipe1 = Recipe.new(:name => "Milanesas")
    recipe1.feeling_list = "yummy, wantfun"
    
    recipe1.save
    
    recipe2 = Recipe.new(:name => "Pastas")
    recipe2.feeling_list = "energy, napafter"
    
    recipe2.save
    
    Recipe.feelings.length.should == 4
    
    list_names = Recipe.feelings.collect { |tag| tag.name } 
    
    list_names.should include "yummy", "wantfun", "energy", "napafter"
  end
  
  it "will bring all ocassions related to recipes when asked for ocassions" do 
    recipe1 = Recipe.new(:name => "Milanesas")
    recipe1.ocassion_list = "family, friends"
    
    recipe1.save
    
    recipe2 = Recipe.new(:name => "Pastas")
    recipe2.ocassion_list = " withGranny"
    
    recipe2.save
    
    Recipe.ocassions.length.should == 3
    
    list_names = Recipe.ocassions.collect { |tag| tag.name } 
    
    list_names.should include "family", "friends", "withGranny"
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
