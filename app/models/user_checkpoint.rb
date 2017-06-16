# == Schema Information
#
# Table name: user_checkpoints
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  checkpoint_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserCheckpoint < ApplicationRecord
  belongs_to :user
  belongs_to :checkpoint
end
