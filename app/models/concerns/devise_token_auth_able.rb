# frozen_string_literal: true

module DeviseTokenAuthAble
  extend ActiveSupport::Concern
  include Mongoid::Locker

  included do
    field :locking_name, type: String
    field :locked_at, type: Time

    ## Database authenticatable
    field :email,              type: String, default: ''
    field :encrypted_password, type: String, default: ''

    ## Recoverable
    field :reset_password_token,        type: String
    field :reset_password_sent_at,      type: Time
    field :reset_password_redirect_url, type: String
    field :allow_password_change,       type: Boolean, default: false

    ## Rememberable
    field :remember_created_at, type: Time

    ## Trackable
    field :sign_in_count,      type: Integer, default: 0
    field :current_sign_in_at, type: Time
    field :last_sign_in_at,    type: Time
    field :current_sign_in_ip, type: String
    field :last_sign_in_ip,    type: String

    ## Confirmable
    field :confirmation_token,   type: String
    field :confirmed_at,         type: Time
    field :confirmation_sent_at, type: Time
    field :unconfirmed_email,    type: String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
    # field :locked_at,       type: Time

    ## Required
    field :provider, type: String
    field :uid,      type: String, default: ''

    ## Tokens
    field :tokens, type: Hash, default: {}

    index({ email: 1 }, { name: 'email_index', unique: true, background: true })
    index({ reset_password_token: 1 },
          { name: 'reset_password_token_index', unique: true, sparse: true, background: true })
    index({ confirmation_token: 1 }, { name: 'confirmation_token_index', unique: true, sparse: true, background: true })
    index({ uid: 1, provider: 1 }, { name: 'uid_provider_index', unique: true, background: true })
    # index({ unlock_token: 1 }, { name: 'unlock_token_index', unique: true, sparse: true, background: true })
  end
end
