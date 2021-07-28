# frozen_string_literal: true

require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
            resources :groups
          end

    scope module: :v2,
          constraints: ApiConstraints.new(version: 2, default: false) do
            resources :groups
          end
  end
end
