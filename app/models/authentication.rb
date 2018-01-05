class Authentication < ApplicationRecord
  authenticates_with_sorcery!
end
