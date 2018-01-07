class Message < ApplicationRecord
  belongs_to :user
  has_many :acceptances, dependent: :destroy
  validates :uuid, uniqueness: true, presence: true

  def to_key
    [uuid]
  end

  def to_param
    uuid
  end
end
