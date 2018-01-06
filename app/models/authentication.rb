class Authentication < ApplicationRecord
  authenticates_with_sorcery!

  has_one :user
  validates :email, uniqueness: true, presence: true
end
