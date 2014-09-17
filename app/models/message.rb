class Message < ActiveRecord::Base
  belongs_to :user
  has_many :destinations

  attr_accessor :emails
end
