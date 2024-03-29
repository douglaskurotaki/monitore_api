# frozen_string_literal: true

json.extract! group, :id, :name, :slug, :favorite, :order, :created_at, :updated_at
json.url api_group_url(group, format: :json)
