class RemoveColumnFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :description
  end
end
