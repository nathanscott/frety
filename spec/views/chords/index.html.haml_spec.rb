require 'spec_helper'

describe "chords/index.html.haml" do
  before(:each) do
    assign(:chords, [
      stub_model(Chord,
        :name => "Name",
        :hash => "Hash",
        :ip => "Ip",
        :position => 1,
        :key => "Key"
      ),
      stub_model(Chord,
        :name => "Name",
        :hash => "Hash",
        :ip => "Ip",
        :position => 1,
        :key => "Key"
      )
    ])
  end

  it "renders a list of chords" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Hash".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Ip".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Key".to_s, :count => 2)
  end
end
