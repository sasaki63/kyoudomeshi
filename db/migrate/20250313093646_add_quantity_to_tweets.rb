class AddQuantityToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :quantity, :text
  end
end
