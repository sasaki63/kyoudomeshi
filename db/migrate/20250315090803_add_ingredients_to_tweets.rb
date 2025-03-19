class AddIngredientsToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :ingredient_names, :text
    add_column :tweets, :ingredient_quantities, :text
  end
end
