class AddColumnToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :price, :integer, default: 123_456_789
  end
end
