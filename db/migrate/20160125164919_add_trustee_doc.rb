class AddTrusteeDoc < ActiveRecord::Migration
  def change
    add_column :declarations, :trustee_series, :string, limit: 8
    add_column :declarations, :trustee_number, :string, limit: 10
    add_column :declarations, :trustee_date, :date
    add_column :declarations, :trustee_dept, :string, limit: 255
  end
end
