# frozen_string_literal: true

class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :slug, type: String
  field :favorite, type: Mongoid::Boolean, default: false

  belongs_to  :workspace, -> { includes :author },
              counter_cache: true,
              inverse_of: :groups,
              touch: true

  validates :name, presence: true
end
