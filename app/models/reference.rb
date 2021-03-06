# == Schema Information
#
# Table name: references
#
#  id            :integer          not null, primary key
#  checkpoint_id :integer
#  name          :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Reference < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
end
