# == Schema Information
#
# Table name: sections
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  missions_count :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Section < ApplicationRecord
  has_many :missions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
