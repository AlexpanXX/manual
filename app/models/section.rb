class Section < ApplicationRecord
  has_many :checkpoints

  validates :name, presence: true
end
