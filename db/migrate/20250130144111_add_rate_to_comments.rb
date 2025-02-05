class AddRateToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :rate, :float
  end
end
