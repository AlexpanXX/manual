# == Schema Information
#
# Table name: identifies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Identify < ApplicationRecord
  belongs_to :user
end
