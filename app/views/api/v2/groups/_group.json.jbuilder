# frozen_string_literal: true

json.extract! group, :id, :name, :slug, :created_at, :updated_at
json.url api_group_url(group, format: :json)
