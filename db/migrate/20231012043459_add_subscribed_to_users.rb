class AddSubscribedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :subscribed, :boolean, default: false
  end
end
