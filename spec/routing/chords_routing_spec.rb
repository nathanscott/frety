require "spec_helper"

describe ChordsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/chords" }.should route_to(:controller => "chords", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/chords/new" }.should route_to(:controller => "chords", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/chords/1" }.should route_to(:controller => "chords", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/chords/1/edit" }.should route_to(:controller => "chords", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/chords" }.should route_to(:controller => "chords", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/chords/1" }.should route_to(:controller => "chords", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/chords/1" }.should route_to(:controller => "chords", :action => "destroy", :id => "1")
    end

  end
end
