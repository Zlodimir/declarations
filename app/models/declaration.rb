class Declaration < ActiveRecord::Base
  validates :operation_id, presence: true
end
