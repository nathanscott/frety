class ChordsController < ApplicationController
  # GET /chords
  # GET /chords.xml
  def index
    @chords = Chord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chords }
    end
  end

  # GET /chords/1
  # GET /chords/1.xml
  def show
    @chord = Chord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chord }
    end
  end

  # GET /chords/new
  # GET /chords/new.xml
  def new
    @chord = Chord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chord }
    end
  end

  # GET /chords/1/edit
  def edit
    @chord = Chord.find(params[:id])
  end

  # POST /chords
  # POST /chords.xml
  def create
    # params[:chord]["notes_attributes"].delete_if {|attributes| attributes.length<=1}
    @chord = Chord.new(params[:chord])
    
    logger.info ">>"
    logger.info params[:chord].inspect

    respond_to do |format|
      if @chord.save
        format.html { redirect_to(@chord, :notice => 'Chord was successfully created.') }
        format.xml  { render :xml => @chord, :status => :created, :location => @chord }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chords/1
  # PUT /chords/1.xml
  def update
    @chord = Chord.find(params[:id])

    respond_to do |format|
      if @chord.update_attributes(params[:chord])
        format.html { redirect_to(@chord, :notice => 'Chord was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chords/1
  # DELETE /chords/1.xml
  def destroy
    @chord = Chord.find(params[:id])
    @chord.destroy

    respond_to do |format|
      format.html { redirect_to(chords_url) }
      format.xml  { head :ok }
    end
  end
end
