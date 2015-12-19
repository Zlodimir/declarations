class Declaration < ActiveRecord::Base
  validates :operation_id, presence: true

  def owner_name
    [self.owner_last_name, self.owner_first_name, self.owner_second_name].join(' ')
  end
end
