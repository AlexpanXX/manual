class Checkpoint < ApplicationRecord
  has_one :reference

  validates :name, presence: true
end
