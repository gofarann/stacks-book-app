class RemoveAuthorCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :author
  end
end
