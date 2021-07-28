# frozen_string_literal: true

json.array! @groups, partial: 'api/v2/groups/group', as: :group
