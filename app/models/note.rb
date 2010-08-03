class Note < ActiveRecord::Base

  belongs_to :chord
  
  attr_accessor :on
  
  validates_presence_of :fret, :string
  validates_uniqueness_of :string, :scope => :chord_id

end
