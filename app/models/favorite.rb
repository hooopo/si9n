# encoding: utf-8
class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :signature

  validates :user_id, :presence => true
  validates :signature_id, :presence => true
  validates_uniqueness_of :signature_id, :scope => :user_id
end
