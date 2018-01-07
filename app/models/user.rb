class User < ApplicationRecord
  belongs_to :authentication
  has_many :messages
end
