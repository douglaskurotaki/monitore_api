# frozen_string_literal: true

class Workspace
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :slug, type: String
  field :order, type: Integer

  has_many :groups, inverse_of: :workspace, autosave: true, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
