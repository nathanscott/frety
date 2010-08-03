require 'spec_helper'

describe "chords/new.html.haml" do
  before(:each) do
    assign(:chord, stub_model(Chord,
      :new_record? => true,
      :name => "MyString",
      :hash => "MyString",
      :ip => "MyString",
      :position => 1,
      :key => "MyString"
    ))
  end

  it "renders new chord form" do
    render

    rendered.should have_selector("form", :action => chords_path, :method => "post") do |form|
      form.should have_selector("input#chord_name", :name => "chord[name]")
      form.should have_selector("input#chord_hash", :name => "chord[hash]")
      form.should have_selector("input#chord_ip", :name => "chord[ip]")
      form.should have_selector("input#chord_position", :name => "chord[position]")
      form.should have_selector("input#chord_key", :name => "chord[key]")
    end
  end
end
