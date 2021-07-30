# frozen_string_literal: true

class Workspace
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :slug, type: String
  field :order, type: Integer
  index :slug

  validates :name, presence: true
end
