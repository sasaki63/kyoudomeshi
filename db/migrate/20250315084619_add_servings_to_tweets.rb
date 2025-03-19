class AddServingsToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :servings, :integer
  end
end
