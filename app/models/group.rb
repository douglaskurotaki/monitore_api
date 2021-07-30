# frozen_string_literal: true

class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :slug, type: String
  field :favorite, type: Mongoid::Boolean, default: false

  validates :name, presence: true
end
