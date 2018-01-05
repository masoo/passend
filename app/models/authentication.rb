class Authentication < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :email, uniqueness: true, presence: true
end
