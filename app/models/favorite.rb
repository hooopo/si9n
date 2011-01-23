# encoding: utf-8
class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :signature

  validates_presence_of :user_id
  validates_presence_of :signature_id
  validates_uniqueness_of :signature_id, :scope => :user_id
end
