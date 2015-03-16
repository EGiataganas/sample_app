# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string
#  email             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  ecrypted_password :string
#

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessor :password
  # attr_accessible :name, :email, :password, :password_confirmation

  validates :name,  presence: true, length: { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, confirmation: true, length: { in: 6..40 }
end
