class Restaurant < ApplicationRecord
  # Invalid records stay unsaved so the form can display their errors.
  validates :name, presence: true
end
