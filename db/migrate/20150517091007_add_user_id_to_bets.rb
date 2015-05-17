class AddUserIdToBets < ActiveRecord::Migration
  def change
    add_column :bets, :user_id, :integer
    add_index :bets, :user_id
  end
end
