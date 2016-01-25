ActiveAdmin.register Declaration do
  index do
    selectable_column
    column :dept_name
    column 'Operation', :operation_id
    column :date
    column :owner_name
  end
end
