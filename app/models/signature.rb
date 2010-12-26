class Signature < ActiveRecord::Base

  validates :body, :presence => true, :uniqueness => true, :length => { :maximum => 200 }

  def self.random
    self.order("RAND()").first
  end

  def up!
    self.up = self.up + 1
    self.save
  end

  def down!
    self.down = self.down + 1
    self.save
  end

end
