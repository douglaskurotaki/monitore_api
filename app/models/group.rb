# frozen_string_literal: true

class Group
  include Mongoid::Document
  field :name, type: String
  field :slug, type: String
end
