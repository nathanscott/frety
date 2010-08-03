require 'spec_helper'

describe "chords/show.html.haml" do
  before(:each) do
    @chord = assign(:chord, stub_model(Chord,
      :name => "Name",
      :hash => "Hash",
      :ip => "Ip",
      :position => 1,
      :key => "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Hash".to_s)
    rendered.should contain("Ip".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Key".to_s)
  end
end
