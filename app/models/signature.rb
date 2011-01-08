class Signature < ActiveRecord::Base

  belongs_to :user

  MAX_BODY_SIZE = 203

  validates :body, :presence => true, :uniqueness => true, :length => { :maximum => MAX_BODY_SIZE }

  def self.random
    self.all.sample
  end

  def up!
    self.up = self.up + 1
    self.save
  end

  def body_merge_url(options = {})
    options = {:size => 128, :split => " via:"}.merge(options)
    size_left = options[:size] - options[:split].size - options[:url].size

    utf8_word_list = self.body.split(//u)

    if utf8_word_list.size > size_left
      utf8_word_list[0..size_left - 3].join + "..." + options[:split] + options[:url]
    else
      self.body + options[:split] + options[:url]
    end
  end
end
