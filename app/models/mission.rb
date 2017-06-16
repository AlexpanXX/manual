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
  has_many :checkpoints, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true

  def next
    Mission.where("id > ?", id).first
  end

  def prev
    Mission.where("id < ?", id).last
  end
end
