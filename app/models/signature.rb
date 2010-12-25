class Signature < ActiveRecord::Base

  validates :body, :presence => true, :uniqueness => true, :length => { :maximum => 200 }

  def self.random
    self.order("RAND()").first
  end

end
