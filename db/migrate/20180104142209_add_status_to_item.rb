class AddStatusToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :status, :integer
  end
end
