# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  include DeviseTokenAuth::Concerns::SetUserByToken
end
