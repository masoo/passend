class User < ApplicationRecord
  belongs_to :authentication
  has_many :messages

  delegate :email, to: :authentication, prefix: false, allow_nil: false
end
