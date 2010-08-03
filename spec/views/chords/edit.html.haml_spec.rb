require 'spec_helper'

describe "chords/edit.html.haml" do
  before(:each) do
    @chord = assign(:chord, stub_model(Chord,
      :new_record? => false,
      :name => "MyString",
      :hash => "MyString",
      :ip => "MyString",
      :position => 1,
      :key => "MyString"
    ))
  end

  it "renders the edit chord form" do
    render

    rendered.should have_selector("form", :action => chord_path(@chord), :method => "post") do |form|
      form.should have_selector("input#chord_name", :name => "chord[name]")
      form.should have_selector("input#chord_hash", :name => "chord[hash]")
      form.should have_selector("input#chord_ip", :name => "chord[ip]")
      form.should have_selector("input#chord_position", :name => "chord[position]")
      form.should have_selector("input#chord_key", :name => "chord[key]")
    end
  end
end
