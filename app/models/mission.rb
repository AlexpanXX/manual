# == Schema Information
#
# Table name: missions
#
#  id                :integer          not null, primary key
#  section_id        :integer
#  name              :string
#  description       :text
#  checkpoints_count :integer          default("0")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Mission < ApplicationRecord
  belongs_to :section, counter_cache: true
  validates :name, presence: true
  validates :description, presence: true
end
