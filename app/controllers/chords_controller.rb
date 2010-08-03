class ChordsController < ApplicationController
  # GET /chords
  # GET /chords.xml
  def index
    redirect_to root_path

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

  # POST /chords
  # POST /chords.xml
  def create
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

end
