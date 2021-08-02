# frozen_string_literal: true

json.array! @workspaces, partial: 'api/v1/workspaces/workspace', as: :workspace
