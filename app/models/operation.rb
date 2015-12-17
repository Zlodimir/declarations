class Operation < ActiveRecord::Base

  scope :only_root,         -> { where(root_operation_id: nil) }
  scope :by_root_operation, -> (id) { where(root_operation_id: id) }
end
