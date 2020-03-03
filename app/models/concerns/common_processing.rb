require 'active_support'

module Common_Processing
  extend ActiveSupport::Concern

  included do
    scope :new_order, -> { order(created_at: :desc) }
  end
end