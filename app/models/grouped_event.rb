class GroupedEvent < ApplicationRecord
  belongs_to :group
  belongs_to :event
end
