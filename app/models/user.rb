# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default("f")
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  has_many :user_checkpoints
  has_many :cleared_checkpoints, through: :user_checkpoints, source: :checkpoint

  validates :email, presence: true
  validates :password, presence: true

  scope :asc, -> { order("created_at ASC") }

  def admin?
    is_admin
  end

  # 是否标记完成
  def cleared?(checkpoint)
    cleared_checkpoints.include?(checkpoint) && cleared_checkpoints.find(checkpoint).checked
  end

  # 检查点文字信息
  def checkpoint_text(checkpoint)
    cleared_checkpoints.find(checkpoint).text if cleared_checkpoints.include?(checkpoint)
  end

  # 任务是否完成
  def mission_cleared?(mission)
    return true if mission.nil?
    mission.checkpoints_count == cleared_checkpoints.where(mission: mission).count
  end

  # 是否可以开始任务
  def can_start_mission?(mission)
    return mission_cleared?(mission.prev)
  end

  # 第三方登录的用户
  def self.identify(access_token, signed_in_resoruce = nil)
		data = access_token.info
		identify = Identify.find_by(provider: access_token.provider, uid: access_token.uid)

		if identify
			return identify.user
		else
			user = User.find_by(email: data.email || access_token.email)
			if !user
				user = User.create(
					email: data.email,
					password: Devise.friendly_token[0,20]
				)
			end
			identify = Identify.create(
				provider: access_token.provider,
				uid: access_token.uid,
				user: user
			)
			return user
		end
  end
end
