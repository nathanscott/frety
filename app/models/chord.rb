class Chord < ActiveRecord::Base
  
  has_many :notes
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :notes, :reject_if => proc { |attributes| attributes["on"]=="0" }
end
