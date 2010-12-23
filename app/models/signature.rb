class Signature < ActiveRecord::Base

  def self.random
    self.order("RAND()").first
  end

end
