# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Locker
  include DeviseTokenAuthAble

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise  :confirmable,
          :database_authenticatable,
          :omniauthable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  include DeviseTokenAuth::Concerns::User
end
