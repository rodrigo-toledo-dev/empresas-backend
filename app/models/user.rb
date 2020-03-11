class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # include DeviseTokenAuth::Concerns::User
  include DeviseTokenAuth::Concerns::ActiveRecordSupport
  include DeviseTokenAuth::Concerns::User

  before_validation :set_provider
  def set_provider
    self[:provider] = "email" if self[:provider].blank?
  end

  before_validation :set_uid
  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
