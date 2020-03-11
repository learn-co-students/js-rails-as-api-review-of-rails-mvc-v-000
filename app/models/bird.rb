class Bird < ApplicationRecord
  scope :abc_name, -> { order(:name) }
end