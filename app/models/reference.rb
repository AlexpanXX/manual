class Reference < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
end
