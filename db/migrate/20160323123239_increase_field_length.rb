class IncreaseFieldLength < ActiveRecord::Migration
  def change
    change_column :declarations, :owner_doc_series, :string, limit: 25
    change_column :declarations, :owner_doc_number, :string, limit: 25
    change_column :declarations, :owner_telephone, :string, limit: 25
    change_column :declarations, :trustee_doc_series, :string, limit: 25
    change_column :declarations, :trustee_doc_number, :string, limit: 25
    change_column :declarations, :trustee_address, :string, limit: 255
    change_column :declarations, :trustee_telephone, :string, limit: 25
    change_column :declarations, :vehicle_category, :string, limit: 25
    change_column :declarations, :vehicle_regnum, :string, limit: 25
    change_column :declarations, :vehicle_vin, :string, limit: 25
    change_column :declarations, :trustee_series, :string, limit: 25
    change_column :declarations, :trustee_number, :string, limit: 25
  end
end
