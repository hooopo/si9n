# encoding: utf-8
class Signature < ActiveRecord::Base
  MAX_BODY_SIZE = 203

  default_values :rank => 0, :up => 0, :status => 1
  default_value_for :created_at do
    Time.now
  end

  attr_protected :rank, :up, :status

  belongs_to :user
  has_many :comments
  
  validates :user, :presence => true
  validates :body, :presence => true, :uniqueness => true, :length => { :maximum => MAX_BODY_SIZE }

  
  STATUS = {
    1 => "正常",
    0 => "已删除"
  }

  STATUS_NAMES = {
    :normal => 1,
    :deleted => 0
  }

  scope :normal, where("status =?", STATUS_NAMES[:normal])



  before_save :update_ranking


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

  def update_ranking
    self.rank = Utils.ranking(self)
  end

  
end
