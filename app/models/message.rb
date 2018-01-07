class Message < ApplicationRecord
  belongs_to :user
  validates :uuid, uniqueness: true, presence: true

  def to_key
    [uuid]
  end

  def to_param
    uuid
  end
end
