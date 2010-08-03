require 'digest/sha1'
class Chord < ActiveRecord::Base
  
  has_many :notes
  
  after_create :make_hash
  
  validates_presence_of :name, :message => "What are you going to call this thing?"
  accepts_nested_attributes_for :notes, :reject_if => proc { |attributes| attributes["on"]=="0" }
  
  def make_hash
    update_attribute :hash_ref, self.id.to_s(36)
  end
  
end
