require 'spec_helper'

describe ChordsController do

  def mock_chord(stubs={})
    @mock_chord ||= mock_model(Chord, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all chords as @chords" do
      Chord.stub(:all) { [mock_chord] }
      get :index
      assigns(:chords).should eq([mock_chord])
    end
  end

  describe "GET show" do
    it "assigns the requested chord as @chord" do
      Chord.stub(:find).with("37") { mock_chord }
      get :show, :id => "37"
      assigns(:chord).should be(mock_chord)
    end
  end

  describe "GET new" do
    it "assigns a new chord as @chord" do
      Chord.stub(:new) { mock_chord }
      get :new
      assigns(:chord).should be(mock_chord)
    end
  end

  describe "GET edit" do
    it "assigns the requested chord as @chord" do
      Chord.stub(:find).with("37") { mock_chord }
      get :edit, :id => "37"
      assigns(:chord).should be(mock_chord)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created chord as @chord" do
        Chord.stub(:new).with({'these' => 'params'}) { mock_chord(:save => true) }
        post :create, :chord => {'these' => 'params'}
        assigns(:chord).should be(mock_chord)
      end

      it "redirects to the created chord" do
        Chord.stub(:new) { mock_chord(:save => true) }
        post :create, :chord => {}
        response.should redirect_to(chord_url(mock_chord))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved chord as @chord" do
        Chord.stub(:new).with({'these' => 'params'}) { mock_chord(:save => false) }
        post :create, :chord => {'these' => 'params'}
        assigns(:chord).should be(mock_chord)
      end

      it "re-renders the 'new' template" do
        Chord.stub(:new) { mock_chord(:save => false) }
        post :create, :chord => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested chord" do
        Chord.should_receive(:find).with("37") { mock_chord }
        mock_chord.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chord => {'these' => 'params'}
      end

      it "assigns the requested chord as @chord" do
        Chord.stub(:find) { mock_chord(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:chord).should be(mock_chord)
      end

      it "redirects to the chord" do
        Chord.stub(:find) { mock_chord(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(chord_url(mock_chord))
      end
    end

    describe "with invalid params" do
      it "assigns the chord as @chord" do
        Chord.stub(:find) { mock_chord(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:chord).should be(mock_chord)
      end

      it "re-renders the 'edit' template" do
        Chord.stub(:find) { mock_chord(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested chord" do
      Chord.should_receive(:find).with("37") { mock_chord }
      mock_chord.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the chords list" do
      Chord.stub(:find) { mock_chord }
      delete :destroy, :id => "1"
      response.should redirect_to(chords_url)
    end
  end

end
