# == Schema Information
#
# Table name: checkpoints
#
#  id         :integer          not null, primary key
#  mission_id :integer
#  name       :string
#  checked    :boolean          default("f")
#  is_text    :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Checkpoint < ApplicationRecord
  belongs_to :mission, counter_cache: true
  has_one :reference, dependent: :destroy

  validates :name, presence: true
end
