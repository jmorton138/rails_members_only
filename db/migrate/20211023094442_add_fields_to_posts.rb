class AddFieldsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body, :string
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
